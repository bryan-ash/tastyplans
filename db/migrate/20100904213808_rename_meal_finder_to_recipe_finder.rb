class RenameMealFinderToRecipeFinder < ActiveRecord::Migration
  def self.up
    rename_table :meal_finders, :recipe_finders
    rename_column :finder_ingredients, :meal_finder_id, :recipe_finder_id
  end

  def self.down
    rename_table :recipe_finders, :meal_finders
    rename_column :finder_ingredients, :recipe_finder_id, :meal_finder_id
  end
end
