class PlannedMealsController < ApplicationController

  def suggest
    planned_meal = PlannedMeal.find(params[:id])
    planned_meal.recipe = Recipe.last
    planned_meal.save
    redirect_to planned_meal.meal_plan
  end

end
