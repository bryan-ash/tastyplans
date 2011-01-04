module MenuHelper

  def render_menu(item)
    render :partial => "menus/#{item.view_name}", :locals => { item.view_name.to_sym => item }
  end

end
