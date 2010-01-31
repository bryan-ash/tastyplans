class MealPlansController < ApplicationController

  def show
    @meal_plan = MealPlan.find(params[:id])
  end

end
