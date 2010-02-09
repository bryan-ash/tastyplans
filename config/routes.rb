ActionController::Routing::Routes.draw do |map|

  map.resources :meal_plans do |meal_plans|
    meal_plans.resources :planned_meals, :member => { :suggest => :get }
  end

  map.resources :ingredient_amounts

  map.resources :recipes

  map.resources :ingredients

end
