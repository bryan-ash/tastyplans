class AddUserIdToMealPlan < ActiveRecord::Migration
  def self.up
    add_column :meal_plans, :user_id, :integer
  end

  def self.down
    remove_column :meal_plans, :user_id
  end
end
