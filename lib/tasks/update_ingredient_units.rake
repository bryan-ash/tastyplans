
namespace :ohmabel do
  desc "Update ingredient units."
  task :update_ingredient_units => :environment do
    IngredientAmount.all.map(&:update_unit_from_ingredient_name)
  end

  desc "save"
  task :save_amounts => :environment do
    File.open("amounts", "w") do |file|
      IngredientAmount.all.each do |amount|
        file.puts "unit: #{amount.unit}\t\tname: #{amount.ingredient.name}"
      end
    end
  end
end
