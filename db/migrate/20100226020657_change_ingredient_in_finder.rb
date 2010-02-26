class ChangeIngredientInFinder < ActiveRecord::Migration
  def self.up
    change_table :finder_ingredients do |table|
      table.string :name
      table.remove :ingredient_id
    end
  end

  def self.down
    change_table :finder_ingredients do |table|
      table.remove  :name
      table.integer :ingredient_id
    end
  end
end
