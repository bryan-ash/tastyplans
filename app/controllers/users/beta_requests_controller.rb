class Users::BetaRequestsController < ApplicationController

  def index
    @beta_requests = BetaRequest.all
  end

  def new
    @beta_request = BetaRequest.new
  end

  def create
    @beta_request = BetaRequest.new(params[:beta_request])
    
    if @beta_request.save
      redirect_to root_url, :notice => "Thank you for your request, we'll email you when we have a fresh batch ready"
    else
      flash[:alert] = "There was a problem with your request, please try again"
      render :new
    end
  end

  def invite
    beta_request = BetaRequest.find(params[:id])
    User.invite!(:email => beta_request.email)
    redirect_to users_beta_requests_url, :notice => "Invitation was sent"
  end

end
