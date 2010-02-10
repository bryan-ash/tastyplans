class PlannedMeal < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :meal_plan

  before_create :set_recipe_suggestion

  def set_recipe_suggestion
    self.recipe = Recipe.first
  end

  def get_new_recipe_suggestion
    update_attributes :recipe => Recipe.last
  end

end
