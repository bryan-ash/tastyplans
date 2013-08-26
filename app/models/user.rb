class User < ActiveRecord::Base

  belongs_to :current_meal_plan, :class_name => "MealPlan"

  has_many :recipes
  
  devise :database_authenticatable, :invitable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :invitation_token, :invitation_sent_at, :invitations, :password, :password_confirmation, :remember_me, :username
  
  validates_presence_of :username
  validates_uniqueness_of :username, :case_sensitive => false, :message => "is already taken, please choose another"

  scope :all_but_demo, -> { where("username != 'Demo User'").order("username ASC") }
  
  def self.find_for_database_authentication(conditions)
    value = conditions[authentication_keys.first]
    where(["username ILIKE :value OR email ILIKE :value", { :value => value }]).first
  end

  def self.demo
    @demo_user ||= find_or_create_by(username:'Demo User', email:'demo@user.com')
  end

  def self.demo?
    current_user.demo?
  end

  def can_invite?
    not demo? and invitations_available?
  end

  def invitations
    self[:invitations] ||= 0
  end

  def invitations_available?
    self.invitations > 0
  end

  def sent_an_inviation
    update_attribute(:invitations, self.invitations - 1)
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
