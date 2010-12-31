class Ability
  include CanCan::Ability

  def initialize(user)
    return false unless user
    
    can :manage, MealPlan, :user_id => user.id
  end
end
