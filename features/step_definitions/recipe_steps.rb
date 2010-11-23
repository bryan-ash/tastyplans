Given /^(\d) recipes? exists?$/ do |count|
  count.to_i.times { recipe = Factory.create(:recipe) }
end

Given /^recipe "(.+)" exists$/ do |name|
  Factory.create(:recipe, :name => name)
end

Given /^a "(.*) Butty" recipe exists$/ do |filler|
  recipe = Recipe.find_or_create_by_name :name => "#{filler} Butty"
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
  recipe = Recipe.find_or_create_by_name :name => recipe_name
  ingredient_amounts.hashes.each do |ingredient_amount|
    recipe.ingredient_amounts.create(:amount     => ingredient_amount['amount'],
                                     :unit       => ingredient_amount['unit'],
                                     :ingredient => Ingredient.create!(:name => ingredient_amount['ingredient']))
  end
end

Given /^a "([^\"]*)" recipe has directions:$/ do |recipe_name, directions|
  recipe = Recipe.find_or_create_by_name :name => recipe_name
  recipe.update_attributes! :directions => directions
end

Given /^I am editing recipe "([^\"]+)"$/ do |name|
  Given %{recipe "#{name}" exists}
  When  %{I go to the recipe page for "#{name}"}
  And   %{I follow "Edit this recipe"}
end

When /^I create a new recipe$/ do 
  Given %{I am on the recipes page}
  When  %{I follow "Add a new recipe"}
  Then  %{I should be on the new recipe page}

  When %{I fill in "recipe_name" with "Black magic"}
  And  %{I fill in "recipe_ingredient_amounts_attributes_0_ingredient_attributes_name" with "Chocolate"}
  And  %{I fill in "recipe_directions" with "Nothing to do here."}
  And  %{I press "Save new recipe"}
end

When /^I show the "([^\"]*)" recipe$/ do |recipe|
  visit recipe_path(Recipe.find_by_name(recipe))
end

save_edits = "Save your edits"

When /^I change the recipe name to "([^\"]*)"$/ do |name|
  fill_in 'recipe_name', :with => name
  click_button save_edits
end

When /^I change the (\d)(st|nd|rd|th) ingredient name to "([^\"]+)"$/ do |number, code, name|
  fill_in "recipe_ingredient_amounts_attributes_#{number.to_i - 1}_ingredient_attributes_name", :with => name
  click_button save_edits
end

When /^I change the directions to:$/ do |directions|
  fill_in 'recipe_directions', :with => directions
  click_button save_edits
end

When /^I rename recipe "([^\"]+)" to "([^\"]+)"$/ do |old_name, new_name|
  When %{I go to the recipe page for "#{old_name}"}
  And  %{I follow "Edit this recipe"}
  And  %{I change the recipe name to "#{new_name}"}
end

Then /^the new recipe should be shown$/ do
  Then %{I should be on the recipe page for "Black magic"}
  And  %{I should see "Black magic"}
  And  %{I should see "Chocolate"}
  And  %{I should see "Nothing to do here"}
  And  %{I should see "Thank you for adding that new recipe"}
end
