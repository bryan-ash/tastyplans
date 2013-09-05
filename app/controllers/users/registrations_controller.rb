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

  private

  def sign_up_params
    params.require(:user).permit(sign_up_fields)
  end

  def account_update_params
    params.require(:user).permit(sign_up_fields << :current_password)
  end

  def sign_up_fields
    [:email, :username, :password, :password_confirmation]
  end
end
