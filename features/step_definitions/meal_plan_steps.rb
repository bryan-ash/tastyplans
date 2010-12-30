Given /^the meal plan named "([^\"]*)" includes the following meals:$/ do |name, meal_table|
  meal_plan = Factory(:meal_plan, :name => name)
  meal_plan.planned_meals.clear
  meal_table.hashes.each do |meal|
    recipe = Factory(:recipe, :name => meal[:recipe])
    planned_meal = PlannedMeal.new
    planned_meal.recipe = recipe
    meal_plan.planned_meals << planned_meal
  end
end

When /^I show the "([^\"]*)" meal plan$/ do |meal_plan|
  visit meal_plan_path(MealPlan.find_by_name(meal_plan))
end

Then /^the plan should be named with next week\'s date$/ do
  Then "I should see \"#{MealPlan.default_name}\""
end
