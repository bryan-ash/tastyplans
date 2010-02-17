class FinderIngredient < ActiveRecord::Base

  belongs_to :meal_finder
  belongs_to :ingredient
  
end
