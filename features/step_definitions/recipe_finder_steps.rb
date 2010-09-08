Given /^recipe finder 42 has the following ingredients:$/ do |ingredients|
  recipe_finder = RecipeFinder.new
  recipe_finder.id = 42
  recipe_finder.save

  ingredients.raw.flatten.each do |ingredient_name|
    recipe_finder.ingredients.create(:name => ingredient_name)
  end
end

