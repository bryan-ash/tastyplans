class RemoveFinderRecipe < ActiveRecord::Migration
  def self.up
    drop_table :finder_recipes
  end

  def self.down
    create_table :finder_recipes do |t|
      t.integer :meal_finder_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
