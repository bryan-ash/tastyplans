class Users::SessionsController < Devise::SessionsController
  skip_before_filter :require_no_authentication, :only => [ :new, :create ]
  skip_before_filter :ensure_user_is_available

  def new
    sign_out :user
    super
  end
end
