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
    recipes.inject(ShoppingList.new) do |shopping_list, recipe|
      recipe.ingredient_amounts.inject(shopping_list) do |shopping_list, ingredient_amount|
        shopping_list.add(ingredient_amount)
      end
    end
  end

end
