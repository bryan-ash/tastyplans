Given /^the meal plan named "([^\"]*)" includes the following meals:$/ do |name, table|
  meal_plan = Factory(:meal_plan, :name => name)
  meal_plan.planned_meals.clear
  table.hashes.each do |hash|
    recipe = Factory(:recipe, :name => hash[:recipe])
    meal_plan.planned_meals << Factory(:planned_meal, :day => hash[:day], :recipe => recipe)
  end
end

When /^I show the "([^\"]*)" meal plan$/ do |meal_plan|
  visit meal_plan_path(MealPlan.find_by_name(meal_plan))
end

Then /^the plan should be named with next week\'s date$/ do
  Then "I should see \"#{MealPlan.default_name}\""
end

Then /^I should see a suggested recipe$/ do
  within('#monday') do |content|
    recipe_name = content.dom.children.text
    Recipe.find_by_name(recipe_name).should_not be_nil
  end
end
