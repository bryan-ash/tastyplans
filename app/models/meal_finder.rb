class MealFinder < ActiveRecord::Base

  has_many :ingredients, :class_name => 'FinderIngredient'

  has_many :finder_recipes
  has_many :recipes, :through => :finder_recipes
  
  attr_reader :ingredient
  
  def add_ingredient(ingredient_name)
    ingredients.create(:name => ingredient_name)
  end

  def find_recipes
    self.recipes = Recipe.ingredients_name_like_all(ingredients.map(&:name)).all
  end

end
