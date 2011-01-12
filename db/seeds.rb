# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
demo_user = User.find_by_username("Demo User")

MealPlan.find_or_create_by_name(:name => "Empty Plan", :user => demo_user)

meal_plan = MealPlan.find_or_create_by_name(:name => "Birthday Week", :user => demo_user)
demo_user.current_meal_plan = meal_plan
demo_user.save

["Beef and Red Bean Chili",
 "Devil's Food Layer Cake"
].each do |recipe_name|
  recipe = Recipe.find_by_name(recipe_name)
  meal_plan.planned_meals << PlannedMeal.create(:recipe => recipe)
  meal_plan.save
end
