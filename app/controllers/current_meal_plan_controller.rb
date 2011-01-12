class CurrentMealPlanController < ApplicationController

  include MealPlansHelper
  
  def add_recipe
    if demo_mode_active?
      redirect_to :back, :alert => "Sign up if you'd like to create and edit meal plans" and return false
    end

    recipe = Recipe.find(params[:id])
    current_meal_plan.planned_meals.create(:recipe => recipe)
    redirect_to :back, :notice => "That recipe was added to your current meal plan"
  end

  def edit
    redirect_to edit_meal_plan_path(current_meal_plan)
  end

end
