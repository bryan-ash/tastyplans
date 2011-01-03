class MealPlansController < ApplicationController
  load_and_authorize_resource
  
  def create
    if @meal_plan.save
      set_current_meal_plan_if_selected(params)
      redirect_to edit_meal_plan_path(@meal_plan), :notice => "Your meal plan is ready for some recipes"
    else
      flash.now[:alert] = "Sorry, we could not save your meal plan"
      render :action => "new"
    end
  end

  def update
    if @meal_plan.update_attributes(params[:meal_plan])
      set_current_meal_plan_if_selected(params)
      redirect_to edit_meal_plan_path(@meal_plan), :notice => "Your meal plan is ready for some recipes"
    else
      flash.now[:alert] = "Sorry, we could not save your meal plan"
      render :action => "edit"
    end
  end

  def shopping_list
    @ingredient_amounts = @meal_plan.planned_meals.inject([]) do |amounts, planned_meal|
      planned_meal.recipe.ingredient_amounts.inject(amounts) { |amounts, ingredient| amounts << ingredient }
    end
  end

  def set_current_meal_plan_if_selected(params)
    current_user.update_attribute('current_meal_plan', @meal_plan) if params[:current_meal_plan] == 'yes'
  end

end
