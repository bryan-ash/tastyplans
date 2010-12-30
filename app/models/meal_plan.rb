class MealPlan < ActiveRecord::Base

  has_many :planned_meals

  def self.default_name
    "Week of #{Date.today.monday.next_week.readable_inspect}"
  end

  def name
    read_attribute(:name) or MealPlan.default_name
  end

end
