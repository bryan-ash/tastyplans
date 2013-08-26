Given /^I have a meal plan named "([^\"]*)" with the following meals:$/ do |name, meal_table|
  meal_plan = FactoryGirl.create(:meal_plan, :name => name, :user => @current_scenario_user)
  meal_plan.planned_meals.clear
  meal_table.hashes.each do |meal|
    recipe = FactoryGirl.create(:recipe, :name => meal[:recipe])
    planned_meal = PlannedMeal.new
    planned_meal.recipe = recipe
    meal_plan.planned_meals << planned_meal
  end
end

Given /^I have a meal plan named "([^\"]*)"$/ do |name|
  step %{I follow "Start a new plan"}
  step %{I fill in "Give this meal plan a name" with "#{name}"}
  step %{I press "Save this meal plan"}
end

Given /^I have a current meal plan named "([^\"]*)"$/ do |name|
  step %{I have a meal plan named "#{name}"}
  step %{I make "#{name}" my current meal plan}
end

When /^I make "([^\"]+)" my current meal plan$/ do |name|
  step %{I go to the edit meal plan "#{name}" page}
  step %{I check "Make this your current meal plan"}
  step %{I press "Save this meal plan"}
end

Given /^recipe "([^\"]+)" is in my current meal plan$/ do |recipe|
  step %{I have a current meal plan named "Big Plan"}
  step %{I add recipe "#{recipe}" to my current meal plan}
end

Given /^\"another\" user has a meal plan$/ do
  step %{a user with Username "another"}
  MealPlan.new(:name    => "another user's plan",
               :user_id => User.find_by_username("another")).save!
end

When /^I edit \"another\" user\'s meal plan$/ do
  plan = MealPlan.find_by_name("another user's plan")
  visit edit_meal_plan_path(plan)
end

When /^I add recipe "([^\"]+)" to my current meal plan$/ do |recipe|
  step %{recipe "#{recipe}" exists}
  step %{I show the "#{recipe}" recipe}
  step %{I press "Add to Meal Plan"}
end

When /^I remove "([^\"]+)" from my current meal plan$/ do |recipe|
  visit edit_current_meal_plan_path
  click_button 'remove'
end

Then /^the plan should be named with this week\'s date$/ do
  step %{the "meal_plan_name" field should contain "#{MealPlan.default_name}"}
end

Then /^I should not see \"another\" user\'s plans$/ do
  step %{I should not see "another user's plan"}
end

Then /^"([^\"]+)" should not be in my current meal plan$/ do |recipe|
  step %{I follow "My current plan"}
  step %{I should not see "#{recipe}" within "article"}
end
