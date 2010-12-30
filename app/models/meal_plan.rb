class MealPlan < ActiveRecord::Base

  has_many :planned_meals

  default_scope order('created_at DESC')

  after_initialize :set_defaults

  def self.user_plans(user)
    where(:user_id => user)
  end
    
  def self.default_name
    "Week of #{Date.today.monday.readable_inspect}"
  end

  def set_defaults
    self.name ||= MealPlan.default_name
  end

end
