class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, MealPlan, :user_id => user.id
    cannot :update, User, :id => User.demo.id

    can :manage, User if user.is_admin?
  end
end
