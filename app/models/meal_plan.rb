class MealPlan < ActiveRecord::Base

  has_many :planned_meals

  after_create :formulate_a_plan
  
  def self.default_name
    "Week of #{Date.today.monday.next_week.readable_inspect}"
  end

  def name
    read_attribute(:name) or MealPlan.default_name
  end

  def formulate_a_plan
    ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'].each do |day|
      planned_meals.create(:day => day)
    end
  end

end
