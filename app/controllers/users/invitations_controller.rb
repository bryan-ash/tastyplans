class Users::InvitationsController < Devise::InvitationsController

  def new
    if demo_mode_active?
      redirect_to root_url, :alert => "Please sign in.  We don't want just anyone sending invitations!" and return false
    end
    
    super
  end

end
