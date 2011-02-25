class Users::PasswordsController < Devise::PasswordsController
  skip_before_filter :require_no_authentication

  def new
    sign_out :user
    super
  end
end
