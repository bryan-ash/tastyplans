module MealPlansHelper

  def current_meal_plan?(meal_plan)
    meal_plan == current_user.current_meal_plan
  end

end
