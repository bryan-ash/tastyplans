class Recipe < ActiveRecord::Base

  has_many :ingredient_amounts, :dependent => :destroy
  has_many :ingredients, :through => :ingredient_amounts

  accepts_nested_attributes_for :ingredient_amounts,
  :reject_if => lambda { |a| a[:ingredient_attributes][:name].blank? },
  :allow_destroy => true

  validates_presence_of :name, :directions
  
  default_scope :order => 'name ASC'

  scope :with_ingredient, lambda { |ingredient| joins(:ingredients).where({:ingredients => {:name.matches => "%#{ingredient}%"}}) }
                                                    
  def self.with_ingredients(ingredients)
    recipe_collections = ingredients.map { |ingredient| with_ingredient(ingredient).all }
    recipe_collections.inject { |recipes, next_set| recipes & next_set }.uniq
  end

  def self.suggestion(current = nil)
    first unless current
    last
  end

end
