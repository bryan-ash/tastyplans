Given /^the meal plan named "([^\"]*)" includes the following meals:$/ do |name, table|
  meal_plan = Factory(:meal_plan, :name => name)
  table.hashes.each do |hash|
    recipe = Factory(:recipe, :name => hash[:recipe])
    meal_plan.planned_meals << Factory(:planned_meal, :day => hash[:day], :recipe => recipe)
  end
end

When /^I show the "([^\"]*)" meal plan$/ do |meal_plan|
  visit meal_plan_path(MealPlan.find_by_name(meal_plan))
end
