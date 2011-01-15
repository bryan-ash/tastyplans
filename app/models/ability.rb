class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, MealPlan, :user_id => user.id
  end
end
