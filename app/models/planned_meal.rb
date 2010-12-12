class PlannedMeal < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :meal_plan

end
