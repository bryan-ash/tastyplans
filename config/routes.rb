ActionController::Routing::Routes.draw do |map|
  map.resources :ingredient_amounts

  map.resources :recipes


  map.resources :ingredients

end
