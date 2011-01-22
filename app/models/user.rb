class User < ActiveRecord::Base

  belongs_to :current_meal_plan, :class_name => "MealPlan"
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :username, :password, :password_confirmation, :remember_me

  validates_presence_of :username
  validates_uniqueness_of :username, :case_sensitive => false, :message => "Username is already taken, please choose another"

  scope :all_but_demo, where("username != 'Demo User'").order("username ASC")
  
  def self.find_for_database_authentication(conditions)
    value = conditions[authentication_keys.first]
    where(["username ILIKE :value OR email ILIKE :value", { :value => value }]).first
  end

  def self.demo
    @demo_user ||= find_or_create_by_username('Demo User', :email => 'demo@user.com')
  end

  def self.demo?
    current_user.demo?
  end

  def demo?
    self == User.demo
  end

  def is_admin?
    self.admin
  end

  def signed_in_message
    if demo?
      "Demo mode active"
    else
      "Signed in as #{username}."
    end
  end
  
end
