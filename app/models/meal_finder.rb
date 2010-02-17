class MealFinder < ActiveRecord::Base

  has_many :finder_ingredients
  has_many :ingredients, :through => :finder_ingredients

  has_many :finder_recipes
  has_many :recipes, :through => :finder_recipes
  
  attr_reader :ingredient
  
  def add_ingredient(ingredient_name)
    found = Ingredient.named_like(ingredient_name).first
    self.ingredients << found unless self.ingredients.exists?(found) if found
  end

  def find_recipes
    self.recipes = Recipe.with_ingredients(self.ingredients)
  end

end
