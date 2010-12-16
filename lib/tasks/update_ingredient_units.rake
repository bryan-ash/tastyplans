
desc "Update ingredient units."
task :update_ingredient_units => :environment do
  IngredientAmount.includes('ingredient').where("ingredients.name LIKE 'tablespoons %'").each do |ia|
    ia.update_attributes(:unit => "tablespoon")
  end
  Ingredient.where("name LIKE 'tablespoons %'").each do |ingredient|
    ingredient.update_attributes(:name => ingredient.name.sub(/^tablespoons /, ''))
  end
end
