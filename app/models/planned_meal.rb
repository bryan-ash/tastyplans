class PlannedMeal < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :meal_plan

  after_create :get_new_recipe_suggestion

  def get_new_recipe_suggestion
    update_attribute :recipe, Recipe.suggestion(recipe)
  end

end
