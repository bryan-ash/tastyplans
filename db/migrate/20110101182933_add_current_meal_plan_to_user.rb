class AddCurrentMealPlanToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :current_meal_plan_id, :integer
  end

  def self.down
    remove_column :users, :current_meal_plan_id
  end
end
