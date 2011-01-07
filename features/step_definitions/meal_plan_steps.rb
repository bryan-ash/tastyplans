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

Given /^I have a meal plan named "([^\"]*)"$/ do |name|
  Given %{I follow "Start a new plan"}
  And   %{I fill in "Give this meal plan a name" with "#{name}"}
  And   %{I press "Save this meal plan"}
end

Given /^I have a current meal plan named "([^\"]*)"$/ do |name|
  Given %{I have a meal plan named "#{name}"}
  And   %{I make "#{name}" my current meal plan}
end

When /^I make "([^\"]+)" my current meal plan$/ do |name|
  When %{I go to the edit meal plan "#{name}" page}
  And  %{I check "Make this your current meal plan"}
  And  %{I press "Save this meal plan"}
end

Given /^recipe "([^\"]+)" is in my current meal plan$/ do |recipe|
  Given %{I have a current meal plan named "Big Plan"}
  And   %{I add recipe "#{recipe}" to my current meal plan}
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

When /^I add recipe "([^\"]+)" to my current meal plan$/ do |recipe|
  And  %{recipe "#{recipe}" exists}
  When %{I show the "#{recipe}" recipe}
  And  %{I press "Add to Meal Plan"}
end

When /^I remove "([^\"]+)" from my current meal plan$/ do |recipe|
  visit edit_current_meal_plan_path
  click_button 'remove'
end

Then /^the plan should be named with this week\'s date$/ do
  Then %{the "meal_plan_name" field should contain "#{MealPlan.default_name}"}
end

Then /^I should not see \"another\" user\'s plans$/ do
  Then %{I should not see "another user's plan"}
end

Then /^"([^\"]+)" should not be in my current meal plan$/ do |recipe|
  When %{I follow "My current plan"}
  Then %{I should not see "#{recipe}" within "article"}
end

