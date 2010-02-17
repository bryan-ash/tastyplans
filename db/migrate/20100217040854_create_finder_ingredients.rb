class CreateFinderIngredients < ActiveRecord::Migration
  def self.up
    create_table :finder_ingredients do |t|
      t.integer :meal_finder_id
      t.integer :ingredient_id
      
      t.timestamps
    end
  end

  def self.down
    drop_table :finder_ingredients
  end
end
