class AddPositionToIngredientAmount < ActiveRecord::Migration
  def self.up
    add_column :ingredient_amounts, :position, :integer
  end

  def self.down
    remove_column :ingredient_amounts, :position
  end
end
