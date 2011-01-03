module LayoutHelper

  def meal_plans_menu
    @meal_plans_menu ||= Menu.new("Meal Plans") do |menu|
      menu << MenuLink.new('My current plan', edit_current_meal_plan_path) if current_meal_plan
      menu << MenuLink.new("List my plans", meal_plans_path)
      menu << MenuLink.new("Start a new plan", new_meal_plan_path)
    end
  end

  def recipes_menu
    @recipes_menu ||= Menu.new("Recipes") do |menu|
      menu << MenuLink.new('List all recipes', recipes_path)
      menu << MenuLink.new('Find by ingredient', new_recipe_finder_path)
      menu << MenuLink.new('Add a new recipe', new_recipe_path)
    end
  end

end
