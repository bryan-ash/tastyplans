class MealPlan < ActiveRecord::Base

  has_many :planned_meals
  
end
