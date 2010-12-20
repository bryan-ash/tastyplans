class RemoveNumberFromIngredientAmount < ActiveRecord::Migration
  def self.up
    remove_column :ingredient_amounts, :number
  end

  def self.down
    add_column :ingredient_amounts, :number, :integer
  end
end
