class IngredientsController < ApplicationController

  def index
    @ingredients = Ingredient.all
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(params[:ingredient])

    if @ingredient.save
      flash[:notice] = 'Ingredient was successfully created.'
      redirect_to ingredients_url
    else
      render :action => :new
    end

  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.update_attributes(params[:ingredient])
      flash[:notice] = 'Ingredient was successfully updated.'
      redirect_to ingredients_url
    else
      render :action => :edit
    end

  end

end
