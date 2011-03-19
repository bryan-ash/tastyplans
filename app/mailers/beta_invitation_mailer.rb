class BetaInvitationMailer < ActionMailer::Base
#  default :from => "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.beta_invitation.invite.subject
  #
  def invite(beta_request)
    @beta_request = beta_request

    mail :to => beta_request.email, :subject => "Invitation to join TastyPlans"
  end
end
