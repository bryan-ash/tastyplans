Given /^(\d) recipes? exists?$/ do |count|
  count.to_i.times { recipe = Factory.create(:recipe) }
end

Given /^recipe "(.+)" exists$/ do |name|
  Factory.create(:recipe, :name => name)
end

Given /^a "(.*) Butty" recipe exists$/ do |filler|
  recipe = Recipe.find_or_create_by_name :name => 'Bacon Butty'
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

When /^I show the "([^\"]*)" recipe$/ do |recipe|
  visit recipe_path(Recipe.find_by_name(recipe))
end
