class CreatePlannedMeals < ActiveRecord::Migration
  def self.up
    create_table :planned_meals do |t|
      t.string :day
      t.integer :meal_plan_id
      t.integer :recipe_id

      t.timestamps
    end
  end

  def self.down
    drop_table :planned_meals
  end
end
