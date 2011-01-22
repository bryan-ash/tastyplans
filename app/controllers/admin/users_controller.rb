class Admin::UsersController < ApplicationController

  def index
    @users = User.order("username ASC")
  end

  def new
    @user = User.new
  end

  def create
    admin = params[:user].delete :admin

    @user = User.new(params[:user])

    if @user.save
      @user.update_attribute(:admin, admin)
      redirect_to admin_users_path, :notice => "Successfully created user #{@user.username}"
    else
      render :new, :alert => "Failed to create user"
    end
  end

end
