class User < ActiveRecord::Base

  belongs_to :current_meal_plan, :class_name => "MealPlan"
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :username, :password, :password_confirmation, :remember_me

  validates_uniqueness_of :username, :case_sensitive => false, :message => "Username is already taken, please choose another"

  def self.find_for_database_authentication(conditions)
    value = conditions[authentication_keys.first]
    where(["username ILIKE :value OR email ILIKE :value", { :value => value }]).first
  end

end
