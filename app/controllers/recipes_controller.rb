class RecipesController < ApplicationController
  before_filter :authenticate_user!
  autocomplete_for :ingredient, :name
  
  def index
    @recipes = Recipe.order('name ASC')
  end

  def new
    @recipe = Recipe.new
    3.times { @recipe.ingredient_amounts.build }
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect_to @recipe, :notice => "Thank you for adding that new recipe"
    else
      flash.now[:alert] = "Sorry, we could not save your recipe"
      render :action => "new"
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect_to recipe_path(@recipe), :notice => "Thank you for editing that recipe"
    else
      render :action => 'edit'
    end
  end

end
