class RecipeFindersController < ApplicationController
  before_filter :authenticate_user!
  autocomplete_for :ingredient, :name
  
  def new
    @recipe_finder = RecipeFinder.create
    redirect_to recipe_finder_url(@recipe_finder)
  end

  def show
    @recipe_finder = RecipeFinder.find(params[:id])
  end

  def update
    @recipe_finder = RecipeFinder.find(params[:id])
    @recipe_finder.add_ingredient(params[:recipe_finder][:ingredient])
    redirect_to recipe_finder_url(@recipe_finder)
  end

end
