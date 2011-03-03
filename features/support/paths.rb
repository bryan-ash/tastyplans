module NavigationHelpers

  def path_to(page_name)
    case page_name
    
    when /the home\s?page/
      '/'

    when /sign up/
      new_user_registration_path
      
    when /(sign in|login)/
      new_user_session_path

    when /edit user/
      edit_user_registration_path
      
    when /^the ingredients page/
      ingredients_path

    when /^the new invitation page/
      new_user_invitation_path
      
    when /^my meal plans page/
      meal_plans_path

    when /^my recipes page/
      recipes_path(:user => :me)
      
    when /^the start new meal plan page/
      new_meal_plan_path

    when /^the new meal plan page/
      new_meal_plan_path

    when /^the edit meal plan "([^\"]+)" page/
      edit_meal_plan_path(MealPlan.find_by_name($1))

    when /^the recipe finder page/
      new_recipe_finder_path

    when /^the recipe finder (.*) page/
      recipe_finder_path($1)

    when /^the Recipe Book page/,
      /the recipes page/
      recipes_path

    when /the new recipe page/
      new_recipe_path

    when
      /^the recipe page for "([^\"]+)"$/,
      /^the "([^\"]+)" recipe page$/
      
      recipe = Recipe.find_by_name $1
      recipe_path(recipe)

    when /^an invalid URL$/
      'invalid'
      
    when /^an invalid resource$/
      'recipes/invalid'

    when /^the list users page$/
      admin_users_path
      
    else
      raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
        "Now, go and add a mapping in #{__FILE__}"
    end
  end
end

World(NavigationHelpers)
