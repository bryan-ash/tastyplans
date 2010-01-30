Given /^a recipe "([^\"]*)" with ingredients:$/ do |recipe_name, ingredient_amounts|
  recipe = Recipe.create! :name => recipe_name
  ingredient_amounts.hashes.each do |ingredient_amount|
    recipe.ingredient_amounts.create(:amount     => ingredient_amount['amount'],
                                     :unit       => ingredient_amount['unit'],
                                     :ingredient => Ingredient.create!(:name => ingredient_amount['ingredient']))
  end
end

When /^show the "([^\"]*)" recipe$/ do |recipe|
  visit recipe_path(Recipe.find_by_name(recipe))
end
