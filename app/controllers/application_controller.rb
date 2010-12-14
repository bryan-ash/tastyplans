class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_newest_recipes

  def fetch_newest_recipes
    @recently_added_recipes = Recipe.recently_added
    @recently_edited_recipes = Recipe.recently_edited
  end

end
