class Recipe < ActiveRecord::Base

  has_many :ingredient_amounts, :dependent => :destroy
  has_many :ingredients, :through => :ingredient_amounts

  accepts_nested_attributes_for :ingredient_amounts,
  :reject_if => lambda { |a| a[:ingredient_attributes][:name].blank? },
  :allow_destroy => true

  validates_presence_of :name, :directions
  
  scope :recently_added,  order('recipes.created_at DESC').limit(5)
  scope :recently_edited, order('recipes.updated_at DESC').limit(5)
  
  scope :with_ingredient, lambda { |ingredient| joins(:ingredients).where({:ingredients => {:name.matches => "%#{ingredient}%"}}) }

  before_save :sequence_ingredient_amounts
  
  def self.with_ingredients(ingredients)
    recipe_collections = ingredients.map { |ingredient| self.with_ingredient(ingredient).all }
    recipe_collections.inject { |recipes, next_set| recipes & next_set }.uniq
  end

  def sequence_ingredient_amounts
    ingredient_amounts.sort{|f,s|f.number <=> s.number}.each_with_index do |ingredient_amount, index|
      puts "Updating: [#{index + 1}] #{ingredient_amount.ingredient.name}"
      ingredient_amount.update_attributes(:number => index + 1)
    end

  end

end
