class MealPlansController < ApplicationController
  before_filter :authenticate_user!

  def index
    @meal_plans = MealPlan.user_plans(current_user)
  end

  def new
    @meal_plan = MealPlan.create
  end

  def edit
    @meal_plan = MealPlan.find(params[:id])
  end

  def update
    @meal_plan = MealPlan.find(params[:id])
    if @meal_plan.update_attributes(params[:meal_plan])
      redirect_to @meal_plan, :notice => "Your meal plan is ready for some recipes"
    else
      render :action => "edit"
    end
  end

  def show
    @meal_plan = MealPlan.find(params[:id])
  end

end
