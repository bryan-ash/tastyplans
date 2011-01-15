class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, MealPlan, :user_id => user.id
    cannot :update, User, :id => User.demo.id
  end
end
