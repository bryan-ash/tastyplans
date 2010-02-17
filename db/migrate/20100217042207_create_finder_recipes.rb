class CreateFinderRecipes < ActiveRecord::Migration
  def self.up
    create_table :finder_recipes do |t|
      t.integer :meal_finder_id
      t.integer :recipe_id

      t.timestamps
    end
  end

  def self.down
    drop_table :finder_recipes
  end
end
