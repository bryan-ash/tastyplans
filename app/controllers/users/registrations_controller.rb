class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :authenticate_scope!, :only => [:edit, :update]

  def edit
    redirect_to root_path, :alert => "You don't have permission to do that" and return false if demo_mode_active?
    authenticate_scope!
    super
  end

  def update
    authenticate_scope!
    super
  end

end
