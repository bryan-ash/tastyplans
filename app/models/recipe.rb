class Recipe < ActiveRecord::Base

  has_many :ingredient_amounts
  has_many :ingredients, :through => :ingredient_amounts

  default_scope :order => 'name ASC'

  scope :with_ingredient, lambda { |ingredient| joins(:ingredients).where({:ingredients => {:name.matches => "%#{ingredient}%"}}) }
                                                    
  def self.with_ingredients(ingredients)
    recipe_collections = ingredients.map { |ingredient| with_ingredient(ingredient).all }
    recipe_collections.inject { |recipes, next_set| recipes & next_set }
  end

  def self.suggestion(current = nil)
    first unless current
    last
  end

end
