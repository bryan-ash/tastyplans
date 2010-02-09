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

When /^I ask for a new suggestion for (.+)$/ do |day|
  click_link_within("\##{day}", 'Suggest Another')
end

Then /^the plan should be named with next week\'s date$/ do
  Then "I should see \"#{MealPlan.default_name}\""
end

def recipe_name(day)
  within("\##{day}") do |content|
    within('.recipe') do |content|
      content.dom.children.first.text.gsub(/[\n ]/, '')
    end
  end
end

Then /^I should see a suggested recipe for (.+)$/ do |day|
  Then "I should see \"#{day}\""
  Recipe.find_by_name(recipe_name(day)).should_not be_nil
end

Then /^I should see a new suggestion for (.+)$/ do |day|
  Recipe.find_by_name(recipe_name(day)).should_not == Recipe.first
end
