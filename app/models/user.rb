class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :username, :password, :password_confirmation, :remember_me

  def self.find_for_database_authentication(conditions)
    value = conditions[authentication_keys.first]
    where(["username = :value OR email = :value", { :value => value }]).first
  end

end
