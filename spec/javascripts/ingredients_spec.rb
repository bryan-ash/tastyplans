require "#{File.dirname(__FILE__)}/javascript_spec_helper"

run_javascript_spec("ingredients", "/ingredients/new.haml") do
  # Example code to prepare for a template to be rendered
  #
  #   @current_user = User.make
  #   template.stub!(:current_user).and_return(@current_user)
  #   assigns[:current_user] = @current_user
  assigns[:ingredient] = Ingredient.new
end
