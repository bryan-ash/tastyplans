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

  def meal_plans_menu
    @meal_plans_menu ||= Menu.new("Meal Plans") do |menu|
      menu << MenuLink.new('My current plan', edit_current_meal_plan_path) if current_meal_plan
      menu << MenuLink.new("List my plans", meal_plans_path)
      menu << MenuLink.new("Start a new plan", new_meal_plan_path)
    end
  end

  def recipes_menu
    @recipes_menu ||= Menu.new("Recipes") do |menu|
      menu << MenuLink.new('List my recipes', recipes_path(:user => :me))
      menu << MenuLink.new('List all recipes', recipes_path)
      menu << MenuLink.new('Find by ingredient', new_recipe_finder_path)
      menu << MenuLink.new('Add a new recipe', new_recipe_path)
    end
  end

  def admin_menu
    @admin_menu ||= Menu.new("Admin") do |menu|
      menu << MenuLink.new('List users', admin_users_path)
      menu << MenuLink.new('Add a new user', new_admin_user_path)
    end
  end

end
