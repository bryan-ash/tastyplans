Given /^(\d) recipes? exists?$/ do |count|
  count.to_i.times { recipe = Factory.create(:recipe) }
end

Given /^recipe "(.+)" exists$/ do |name|
  Factory.create(:recipe, :name => name)
end

Given /^a "(.*) Butty" recipe exists$/ do |filler|
  recipe = Recipe.find_or_create_by_name(:name => "#{filler} Butty", :directions => "whip it")
  recipe.ingredient_amounts.create(:amount     => '2',
                                   :unit       => 'slice',
                                   :ingredient => Ingredient.find_or_create_by_name(:name => 'bread'))
  recipe.ingredient_amounts.create(:amount     => '1/8',
                                   :unit       => 'stick',
                                   :ingredient => Ingredient.find_or_create_by_name(:name => 'butter'))
  recipe.ingredient_amounts.create(:amount     => '4',
                                   :unit       => 'slice',
                                   :ingredient => Ingredient.find_or_create_by_name(:name => filler))
end

Given /^a "([^\"]*)" recipe has ingredients:$/ do |recipe_name, ingredient_amounts|
  recipe = Recipe.find_or_create_by_name(:name => recipe_name, :directions => "whip it")
  ingredient_amounts.hashes.each do |ingredient_amount|
    recipe.ingredient_amounts.build(:position   => ingredient_amount['#'],
                                    :amount     => ingredient_amount['amount'],
                                    :unit       => ingredient_amount['unit'],
                                    :ingredient => Ingredient.create!(:name => ingredient_amount['ingredient']))
  end
  recipe.save
end

Given /^a "([^\"]*)" recipe has description:$/ do |recipe_name, description|
  recipe = Recipe.find_or_create_by_name :name => recipe_name
  recipe.update_attributes! :description => description
end

Given /^a "([^\"]*)" recipe has directions:$/ do |recipe_name, directions|
  recipe = Recipe.find_or_create_by_name :name => recipe_name
  recipe.update_attributes! :directions => directions
end

Given /^I am creating a recipe with ingredients:$/ do |ingredient_amounts|
  visit new_recipe_path
  fill_in "recipe[name]", :with => "name"
  fill_in "recipe[directions]", :with => "directions"
  ingredient_amounts.hashes.each_with_index do |ingredient_amount, n|
    fill_in "recipe[ingredient_amounts_attributes][#{n}][ingredient_attributes][name]", :with => ingredient_amount[:name]
  end
end

Given /^I am editing recipe "([^\"]+)"$/ do |name|
  Given %{recipe "#{name}" exists}
  When  %{I go to the recipe page for "#{name}"}
  And   %{I follow "Edit this recipe"}
end

When /^I show the "([^\"]*)" recipe$/ do |recipe|
  visit recipe_path(Recipe.find_by_name(recipe))
end

def save_the_recipe
  click_button "Save your edits"
end

When /^I save the recipe$/ do
  click_button "Save new recipe"
end

When /^I change the recipe name to "([^\"]*)"$/ do |name|
  fill_in 'recipe[name]', :with => name
  save_the_recipe
end

When /^I change the description to:$/ do |description|
  fill_in 'recipe[description]', :with => description
  save_the_recipe
end

When /^I change the (\d)(st|nd|rd|th) ingredient position number to "([^\"]+)"$/ do |ordinal, indicator, position|
  fill_in "recipe[ingredient_amounts_attributes][#{ordinal.to_i - 1}][position]", :with => position
  save_the_recipe
end

When /^I change the (\d)(st|nd|rd|th) ingredient name to "([^\"]+)"$/ do |ordinal, indicator, name|
  fill_in "recipe[ingredient_amounts_attributes][#{ordinal.to_i - 1}][ingredient_attributes][name]", :with => name
  save_the_recipe
end

When /^I delete the (\d)(st|nd|rd|th) ingredient$/ do |ordinal, indicator|
  within("tr:nth-of-type(3)") do
    click_link "remove"
  end
end

When /^I change the directions to:$/ do |directions|
  fill_in 'recipe[directions]', :with => directions
  save_the_recipe
end

When /^I rename recipe "([^\"]+)" to "([^\"]+)"$/ do |old_name, new_name|
  When %{I go to the recipe page for "#{old_name}"}
  And  %{I follow "Edit this recipe"}
  And  %{I change the recipe name to "#{new_name}"}
end

When /^I create a new recipe with (\d) ingredients$/ do |count|
  Given %{I am on the home page}
  When  %{I follow "Add a new recipe"}
  Then  %{I should be on the new recipe page}

  When %{I fill in "recipe_name" with "Black magic"}
  (0...count.to_i).each do |n|
    And  %{I fill in "recipe[ingredient_amounts_attributes][#{n}][ingredient_attributes][name]" with "ingredient#{n}"}
  end
  And  %{I fill in "recipe[directions]" with "Nothing to do here."}
  And  %{I press "Save new recipe"}
end

Then /^the (\d) ingredient recipe should be shown$/ do |count|
  Then %{I should be on the recipe page for "Black magic"}
  And  %{I should see "Black magic"}
  (0...count.to_i).each do |n|
    And  %{I should see "ingredient#{n}"}
  end
  And  %{I should see "Nothing to do here"}
  And  %{I should see "Thank you for adding that new recipe"}
end
