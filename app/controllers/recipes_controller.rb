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

    if demo_mode_active?
      flash.now[:alert] = "Sign up if you'd like to create and edit recipes"
      render :action => "new" and return false
    end

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
    @recipe.ingredient_amounts.each_with_index do |ingredient_amount, index|
      ingredient_amount.update_attributes(:position => index + 1)
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if demo_mode_active?
      flash.now[:alert] = "Sign up if you'd like to create and edit recipes"
      render :action => "edit" and return false
    end

    if @recipe.update_attributes(params[:recipe])
      redirect_to recipe_path(@recipe), :notice => "Thank you for editing that recipe"
    else
      render :action => 'edit'
    end
  end

end
