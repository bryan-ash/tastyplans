class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_newest_recipes
  
  rescue_from ActiveRecord::RecordNotFound, :with => :render_home_with_message

  def render_home_with_message
    flash[:alert] = 'Sorry, the page you requested was not found.'
    render 'home/index', :status => :not_found
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to root_url
  end

  def fetch_newest_recipes
    @recently_added_recipes = Recipe.recently_added
    @recently_edited_recipes = Recipe.recently_edited
  end
end
