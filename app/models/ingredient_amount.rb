class IngredientAmount < ActiveRecord::Base

  belongs_to :ingredient
  belongs_to :recipe

  accepts_nested_attributes_for :ingredient
  
#   def ingredient_name
#     ingredient.name
#   end

#   def ingredient_name=(name)
#     self.ingredient.name = name
#   end

end
