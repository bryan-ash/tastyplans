class Recipe < ActiveRecord::Base

  belongs_to :user
  
  has_many :ingredient_amounts, -> { order :position }, :dependent => :destroy
  has_many :ingredients, :through => :ingredient_amounts

  accepts_nested_attributes_for :ingredient_amounts,
  :reject_if => lambda { |a| a[:ingredient_attributes][:name].blank? },
  :allow_destroy => true

  validates_presence_of :name, :directions

  def self.named_like(name)
    where { |i| i.name.like "%#{name}%" }
  end

  def self.recently_added
    order('created_at DESC').limit(5)
  end

  def self.recently_edited
    order('updated_at DESC').limit(5)
  end
  
  scope :with_ingredient, lambda { |ingredient| joins(:ingredients).where { |i| i.name =~ "%#{ingredient}%" } }

  before_save :sequence_ingredient_amounts

  def next
    Recipe.where('name > ?', name).order('name ASC').limit(1).first
  end

  def previous
    Recipe.where('name < ?', name).order('name DESC').limit(1).first
  end

  def self.with_ingredients(ingredients)
    recipe_collections = ingredients.map { |ingredient| self.with_ingredient(ingredient).all }
    recipe_collections.inject { |recipes, next_set| recipes & next_set }.uniq
  end

  def sequence_ingredient_amounts
    ingredient_amounts.each_with_index do |ingredient_amount, index|
      ingredient_amount.insert_at(ingredient_amount.position || index + 1)
    end
  end

end
