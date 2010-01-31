ActionController::Routing::Routes.draw do |map|
  map.resources :planned_meals

  map.resources :meal_plans

  map.resources :ingredient_amounts

  map.resources :recipes


  map.resources :ingredients

end
