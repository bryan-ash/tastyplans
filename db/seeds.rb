# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
demo_user = User.where(username:"Demo User").first_or_create
demo_user_id = demo_user.id

MealPlan.where(name:"Empty Plan", user_id: demo_user_id).first_or_create

meal_plan = MealPlan.find_or_create_by(name:"Birthday Week", user_id: demo_user_id)
demo_user.current_meal_plan = meal_plan
demo_user.save

["Beef and Red Bean Chili",
 "Devil's Food Layer Cake"
].each do |recipe_name|
  recipe = Recipe.find_by_name(recipe_name)
  meal_plan.planned_meals << PlannedMeal.create(:recipe => recipe)
  meal_plan.save
end
