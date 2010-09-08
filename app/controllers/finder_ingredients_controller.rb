class FinderIngredientsController < ApplicationController

  def destroy
    @recipe_finder = RecipeFinder.find(params[:recipe_finder_id])
    @finder_ingredient = FinderIngredient.find(params[:id])
    @finder_ingredient.destroy

    redirect_to recipe_finder_url(@recipe_finder)
  end

end
