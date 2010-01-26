class CreateIngredients < ActiveRecord::Migration
  def self.up
    create_table :ingredients do |table|
      table.string :name
    end
  end

  def self.down
    drop_table :ingredients
  end
end
