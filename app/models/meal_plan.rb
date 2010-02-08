class MealPlan < ActiveRecord::Base

  has_many :planned_meals

  def after_initialize
    formulate_a_plan
  end
  
  def self.default_name
    "Week of #{Date.today.monday.next_week.readable_inspect}"
  end

  def name
    read_attribute(:name) or MealPlan.default_name
  end

  def formulate_a_plan
    ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'].each do |day|
      planned_meals.build(:day    => day,
                          :recipe => Recipe.first)
    end
  end

end
