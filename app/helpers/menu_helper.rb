module MenuHelper

  #
  # It should be possible in the view to simply "render recipes_menu" but
  # that was throwing an error about missing partial "devise/menus/_menu.html.haml" in view paths...
  #
  # This method allows a single call to render either a Menu, MenuLink or MenuButton
  #
  def render_menu(item)
    render :partial => "menus/#{item.view_name}", :locals => { item.view_name => item }
  end

end
