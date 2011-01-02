Given /^I have a meal plan named "([^\"]*)" with the following meals:$/ do |name, meal_table|
  meal_plan = Factory(:meal_plan, :name => name, :user => User.find_by_email("a@b.net"))
  meal_plan.planned_meals.clear
  meal_table.hashes.each do |meal|
    recipe = Factory(:recipe, :name => meal[:recipe])
    planned_meal = PlannedMeal.new
    planned_meal.recipe = recipe
    meal_plan.planned_meals << planned_meal
  end
end

Given /^I have a current meal plan named "([^\"]*)"$/ do |name|
  Given %{I follow "Start a new plan"}
  And   %{I fill in "Give this meal plan a name" with "#{name}"}
  And   %{I check "Make this your current meal plan"}
  And   %{I press "Save this meal plan"}
end

Given /^\"another\" user has a meal plan$/ do
  Given %{a user with Username "another"}
  MealPlan.new(:name    => "another user's plan",
               :user_id => User.find_by_username("another")).save!
end

When /^I edit \"another\" user\'s meal plan$/ do
  plan = MealPlan.find_by_name("another user's plan")
  visit edit_meal_plan_path(plan)
end

When /^I show the "([^\"]*)" meal plan$/ do |meal_plan|
  visit meal_plan_path(MealPlan.find_by_name(meal_plan))
end

Then /^the plan should be named with this week\'s date$/ do
  Then %{the "meal_plan_name" field should contain "#{MealPlan.default_name}"}
end

Then /^I should not see \"another\" user\'s plans$/ do
  Then %{I should not see "another user's plan"}
end

