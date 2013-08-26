Given /^an ingredient named "(.+)"$/ do |name|
  Ingredient.create! :name => name
end

When /^I create an ingredient named "(.*)"$/ do |name|
  step 'I am on the ingredients page'
  step 'I follow "New"'
  step 'I should see "New Ingredient"'
  step 'I fill in "name" with "' + name + '"'
  step 'I press "Submit"'
end

When /^I rename "(.+)" to "(.+)"$/ do |old, new|
  step 'an ingredient named "' + old + '"'
  step 'I go to the ingredients page'
  step 'I follow "' + old + '"'
  step 'I should see "Editing Ingredient"'
  step 'I fill in "name" with "' + new + '"'
  step 'I press "Submit"'
end
