class CurrentMealPlanController < ApplicationController

  include MealPlansHelper
  
  def add_recipe
    recipe = Recipe.find(params[:id])
    current_meal_plan.planned_meals.create(:recipe => recipe)
    redirect_to :back, :notice => "That recipe was added to your current meal plan"
  end

  def edit
    redirect_to edit_meal_plan_path(current_meal_plan)
  end

end
