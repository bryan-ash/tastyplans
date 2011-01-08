class HomeController < ApplicationController

  def index
  end

  def error
    render_home_with_message
  end

end
