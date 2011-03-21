class Users::InvitationsController < Devise::InvitationsController
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

end
