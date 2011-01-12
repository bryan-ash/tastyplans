class PlannedMealsController < ApplicationController

  def destroy
    if demo_mode_active?
      redirect_to :back, :alert => "Sign up if you'd like to create and edit meal plans" and return false
    end

    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @planned_meal = PlannedMeal.find(params[:id])
    @planned_meal.destroy

    redirect_to edit_meal_plan_url(@meal_plan)
  end
end
