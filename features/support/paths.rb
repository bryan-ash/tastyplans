module NavigationHelpers

  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      '/'

    when /sign up/
      new_user_registration_path
      
    when /sign in/
      new_user_session_path
      
    when /login/
      new_user_session_path
      
    when /^the ingredients page/
      ingredients_path

    when /^the new meal plan page/
      new_meal_plan_path

    when /^the recipe finder page/
      new_recipe_finder_path

    when /^the recipe finder (.*) page/
      recipe_finder_path($1)

    when /^the recipes page/
      recipes_path
      
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
