class FinderIngredient < ActiveRecord::Base

  belongs_to :recipe_finder
  belongs_to :ingredient
  
end
