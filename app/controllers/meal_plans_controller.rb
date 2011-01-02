class MealPlansController < ApplicationController
  load_and_authorize_resource
  
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    if @meal_plan.save
      if params[:current_meal_plan] == 'yes'
        current_user.current_meal_plan = @meal_plan
        current_user.save
      end

      redirect_to @meal_plan, :notice => "Your meal plan is ready for some recipes"
    else
      flash.now[:alert] = "Sorry, we could not save your meal plan"
      render :action => "new"
    end
  end

  def update
    if @meal_plan.update_attributes(params[:meal_plan])
      redirect_to edit_meal_plan_path(@meal_plan), :notice => "Your meal plan is ready for some recipes"
    else
      render :action => "edit"
    end
  end

end
