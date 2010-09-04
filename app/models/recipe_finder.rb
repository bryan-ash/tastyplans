class RecipeFinder < ActiveRecord::Base

  has_many :ingredients, :class_name => 'FinderIngredient'

  attr_reader :ingredient
  
  def add_ingredient(ingredient_name)
    ingredients.create(:name => ingredient_name)
  end

  def recipes
    Recipe.with_ingredients(ingredient_names)
  end

  def ingredient_names
    ingredients.map(&:name)
  end

end
