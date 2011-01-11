class MealPlansController < ApplicationController
  load_and_authorize_resource
  
  def create
    if demo_mode_active?
      flash.now[:alert] = "Sign up if you'd like to create and edit meal plans"
      render :action => "new" and return false
    end

    if @meal_plan.save
      set_current_meal_plan_if_selected(params)
      redirect_to edit_meal_plan_path(@meal_plan), :notice => "Your meal plan is ready for some recipes"
    else
      flash.now[:alert] = "Sorry, we could not save your meal plan"
      render :action => "new"
    end
  end

  def update
    if demo_mode_active?
      flash.now[:alert] = "Sign up if you'd like to create and edit meal plans"
      render :action => "edit" and return false
    end

    if @meal_plan.update_attributes(params[:meal_plan])
      set_current_meal_plan_if_selected(params)
      redirect_to edit_meal_plan_path(@meal_plan), :notice => "Your meal plan is ready for some recipes"
    else
      flash.now[:alert] = "Sorry, we could not save your meal plan"
      render :action => "edit"
    end
  end

  def set_current_meal_plan_if_selected(params)
    current_user.update_attribute('current_meal_plan', @meal_plan) if params[:current_meal_plan] == 'yes'
  end

end
