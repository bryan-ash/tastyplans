class MealFindersController < ApplicationController

  def new
    @meal_finder = MealFinder.create
  end

  def show
    @meal_finder = MealFinder.find(params[:id])
  end

  def update
    @meal_finder = MealFinder.find(params[:id])
    @meal_finder.add_ingredient(params[:meal_finder][:ingredient])
    redirect_to meal_finder_url(@meal_finder)
  end

end
