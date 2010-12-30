class RemoveDayFromPlannedMeals < ActiveRecord::Migration
  def self.up
    remove_column :planned_meals, :day
  end

  def self.down
    add_column :planned_meals, :day, :string
  end
end
