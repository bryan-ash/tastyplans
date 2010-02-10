class MealPlansController < ApplicationController

  def new
    @meal_plan = MealPlan.create
    redirect_to meal_plan_path(@meal_plan)
  end

  def show
    @meal_plan = MealPlan.find(params[:id])
  end

end
