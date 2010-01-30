class AddDirectionsToRecipe < ActiveRecord::Migration
  def self.up
    add_column :recipes, :directions, :text
  end

  def self.down
    remove_column :recipes, :directions
  end
end
