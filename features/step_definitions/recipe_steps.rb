Given /^(\d) recipes? exists?$/ do |count|
  count.to_i.times { recipe = FactoryGirl.create(:recipe) }
end

Given /^recipe "(.+)" exists$/ do |name|
  FactoryGirl.create(:recipe, :name => name)
end

Given /^a "(.*) Butty" recipe exists$/ do |filler|
  recipe = Recipe.find_or_create_by(name: "#{filler} Butty", :directions => "whip it")
  recipe.ingredient_amounts.create(:amount     => '2',
                                   :unit       => 'slice',
                                   :ingredient => Ingredient.find_or_create_by(name: 'bread'))
  recipe.ingredient_amounts.create(:amount     => '1/8',
                                   :unit       => 'stick',
                                   :ingredient => Ingredient.find_or_create_by(name: 'butter'))
  recipe.ingredient_amounts.create(:amount     => '4',
                                   :unit       => 'slice',
                                   :ingredient => Ingredient.find_or_create_by(name: filler))
end

Given /^a "([^\"]*)" recipe has ([^\"]+) ([^\"]+) ([^\"]+)$/ do |recipe_name, amount, unit, ingredient|
  recipe = Recipe.find_or_create_by_name(:name => recipe_name, :directions => "whip it")
  recipe.ingredient_amounts.build(:amount     => amount,
                                  :unit       => unit,
                                  :ingredient => Ingredient.find_or_create_by_name(:name => ingredient))
  recipe.save
end

Given /^a "([^\"]*)" recipe has ingredients:$/ do |recipe_name, ingredient_amounts|
  recipe = Recipe.create_with(directions: "whip it").find_or_create_by(name: recipe_name)
  ingredient_amounts.hashes.each do |ingredient_amount|
    recipe.ingredient_amounts.build(:position   => ingredient_amount['#'],
                                    :amount     => ingredient_amount['amount'],
                                    :unit       => ingredient_amount['unit'],
                                    :ingredient => Ingredient.find_or_create_by(name: ingredient_amount['ingredient']))
  end
  recipe.save
end

Given /^a "([^\"]*)" recipe has description:$/ do |recipe_name, description|
  recipe = Recipe.find_or_create_by_name :name => recipe_name
  recipe.update_attributes! :description => description
end

Given /^a "([^\"]*)" recipe has directions:$/ do |recipe_name, directions|
  recipe = Recipe.find_or_create_by(name: recipe_name)
  recipe.update_attributes(directions: directions)
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
  step %{recipe "#{name}" exists}
  step %{I go to the recipe page for "#{name}"}
  step %{I follow "Edit this recipe"}
end

Given /^I am viewing the "([^\"]+)" recipe$/ do |name|
  step %{recipe "#{name}" exists}
  step %{I go to the recipe page for "#{name}"}
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
  step %{I go to the recipe page for "#{old_name}"}
  step %{I follow "Edit this recipe"}
  step %{I change the recipe name to "#{new_name}"}
end

Given /^I have created a recipe named "My Recipe"$/ do
  step %{I am on the home page}
  step %{I follow "Add a new recipe"}
  step %{I fill in "recipe_name" with "My Recipe"}
  step %{I fill in "recipe[directions]" with "Nothing to do here."}
  step %{I press "Save new recipe"}
end

When /^I create a new recipe with (\d) ingredients$/ do |count|
  step %{I am on the home page}
  step %{I follow "Add a new recipe"}
  step %{I should be on the new recipe page}

  step %{I fill in "recipe_name" with "Black magic"}
  (0...count.to_i).each do |n|
    step  %{I fill in "recipe[ingredient_amounts_attributes][#{n}][ingredient_attributes][name]" with "ingredient#{n}"}
  end
  step %{I fill in "recipe[directions]" with "Nothing to do here."}
  step %{I press "Save new recipe"}
end

Then /^the (\d) ingredient recipe should be shown$/ do |count|
  step %{I should be on the recipe page for "Black magic"}
  step %{I should see "Black magic"}
  (0...count.to_i).each do |n|
    step %{I should see "ingredient#{n}"}
  end
  step %{I should see "Nothing to do here"}
  step %{I should see "Thank you for adding that new recipe"}
end
