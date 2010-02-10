Given /^an ingredient named "(.+)"$/ do |name|
  Ingredient.create! :name => name
end

When /^I create an ingredient named "(.*)"$/ do |name|
  Given 'I am on the ingredients page'
  When  'I follow "New"'
  Then  'I should see "New Ingredient"'
  When  'I fill in "ingredient_name" with "' + name + '"'
  And   'I press "Submit"'
end

When /^I rename "(.+)" to "(.+)"$/ do |old, new|
  Given 'an ingredient named "' + old + '"'
  When  'I go to the ingredients page'
  And   'I follow "' + old + '"'
  Then  'I should see "Editing Ingredient"'
  When  'I fill in "ingredient_name" with "' + new + '"'
  And   'I press "Submit"'
end
