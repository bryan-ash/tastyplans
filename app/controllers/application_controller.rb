class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :ensure_user_is_available, :fetch_newest_recipes
  
  rescue_from ActiveRecord::RecordNotFound, :with => :render_home_with_message

  helper_method :demo_mode_active?
  
  def render_home_with_message
    flash[:alert] = 'Sorry, the page you requested was not found.'
    render 'home/index', :status => :not_found
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end

  def ensure_user_is_available
    current_user || sign_in(User.demo)
  end

  def fetch_newest_recipes
    @recently_added_recipes = Recipe.recently_added
    @recently_edited_recipes = Recipe.recently_edited
  end

  def demo_mode_active?
    current_user.try(:demo?)
  end
end
