class AddNumberToIngredientAmount < ActiveRecord::Migration
  def self.up
    add_column :ingredient_amounts, :number, :integer
  end

  def self.down
    remove_column :ingredient_amounts, :number
  end
end
