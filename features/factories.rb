Factory.define :recipe do |recipe|
  recipe.sequence(:name) { |n| "Recipe#{n}" }
  recipe.directions 'whip it'
end

Factory.define :meal_plan do |meal_plan|
  meal_plan.name 'Meal Plan'
end

Factory.define :planned_meal do |planned_meal|
  planned_meal.day 'Day'
end
