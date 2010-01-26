Given /^an ingredient named "(.+)"$/ do |name|
  Ingredient.create! :name => name
end

When /^I create an ingredient named "(.*)"$/ do |name|
  Given 'I am on the ingredients page'
  When  'I follow "New"'
  Then  'I should see "New Ingredient"'
  When  'I fill in "Name" with "' + name + '"'
  And   'I press "Submit"'
end
