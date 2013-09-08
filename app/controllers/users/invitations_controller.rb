class Users::InvitationsController < Devise::InvitationsController
  prepend_before_filter :ensure_user_is_available
  skip_before_filter :require_no_authentication, :only => [:edit, :update]

  def new
    if demo_mode_active?
      redirect_to root_url, :alert => "Please sign in.  We don't want just anyone sending invitations!" and return false
    end
    super
  end

  def create
    current_user.sent_an_inviation
    super
  end

  def update_resource_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation, :invitation_token)
  end
end
