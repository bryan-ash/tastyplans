Given /^a recipe exists$/ do
  Factory :recipe
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
