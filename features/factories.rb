Factory.define :recipe do |recipe|
  recipe.sequence(:name) { |n| "Recipe#{n}" }
  recipe.directions 'whip it'
end

Factory.define :meal_plan do |meal_plan|
  meal_plan.name 'Meal Plan'
end


