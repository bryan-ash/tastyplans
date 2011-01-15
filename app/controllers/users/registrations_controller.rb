class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]

  def edit
    redirect_to root_path, :alert => "You don't have permission to do that" if demo_mode_active?
  end

end
