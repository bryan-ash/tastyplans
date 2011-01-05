class MealPlan < ActiveRecord::Base

  has_many :planned_meals
  has_many :recipes, :through => :planned_meals
  belongs_to :user
  
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

  def populate_shopping_list
    recipes.each do |recipe|
      recipe.ingredient_amounts.each { |amount| shopping_list << amount }
    end
    shopping_list
  end

  def shopping_list
    @shopping_list ||= []
  end

end
