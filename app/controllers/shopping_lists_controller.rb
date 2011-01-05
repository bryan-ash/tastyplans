class ShoppingListsController < ApplicationController
  
  def show
    @meal_plan = MealPlan.find(params[:meal_plan_id])
    @shopping_list = @meal_plan.populate_shopping_list
  end

end
