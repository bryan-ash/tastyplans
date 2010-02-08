class MealPlansController < ApplicationController

  def new
    @meal_plan = MealPlan.new
  end

  def show
    @meal_plan = MealPlan.find(params[:id])
  end

end
