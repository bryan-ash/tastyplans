class CurrentMealPlanController < ApplicationController

  def add_recipe
    recipe = Recipe.find(params[:id])
    current_user.current_meal_plan(true).planned_meals.create(:recipe => recipe)
    redirect_to :back, :notice => "That recipe was added to your current meal plan"
  end

  def edit
    redirect_to edit_meal_plan_path(current_user.current_meal_plan)
  end

end
