class FinderRecipe < ActiveRecord::Base

  belongs_to :meal_finder
  belongs_to :recipe
  
end
