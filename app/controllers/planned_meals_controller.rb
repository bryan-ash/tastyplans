class PlannedMealsController < ApplicationController

  def destroy
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @planned_meal = PlannedMeal.find(params[:id])
    @planned_meal.destroy

    redirect_to edit_meal_plan_url(@meal_plan)
  end
end
