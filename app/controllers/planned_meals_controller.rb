class PlannedMealsController < ApplicationController

  def suggest
    planned_meal = PlannedMeal.find(params[:id])
    planned_meal.get_new_recipe_suggestion
    redirect_to planned_meal.meal_plan
  end

end
