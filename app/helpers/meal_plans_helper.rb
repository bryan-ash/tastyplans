module MealPlansHelper

  def current_meal_plan
    current_user.current_meal_plan if current_user
  end

  def current_meal_plan?(meal_plan)
    meal_plan == current_meal_plan
  end

end
