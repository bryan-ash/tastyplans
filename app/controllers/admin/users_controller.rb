class Admin::UsersController < ApplicationController

  def index
    @users = User.order("username ASC")
  end

end
