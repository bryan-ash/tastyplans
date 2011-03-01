class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all_but_demo
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

  def edit
  end

  def update
    admin = params[:user].delete :admin

    if params[:user][:password].blank?
      [:password,:password_confirmation,:current_password].each { |param| params[:user].delete(param) }
    end
 
    if @user.update_attributes(params[:user])
      @user.update_attribute(:admin, admin)
      redirect_to admin_users_path, :notice => "Successfully updated user #{@user.username}"
    else
      render :edit, :alert => "Failed to update user"
    end
  end

  def destroy
    @user.destroy
    
    redirect_to admin_users_path, :notice => "Removed user '#{@user.username}'"
  rescue ActiveRecord::RecordNotFound
    redirect_to :back, :alert => "User '#{@user.username}' not found!"
  end

end
