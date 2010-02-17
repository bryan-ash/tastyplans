class CreateMealFinder < ActiveRecord::Migration
  def self.up
    create_table :meal_finders do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :meal_finders
  end
end
