Mabel::Application.routes.draw do

  devise_for :users

  resources :meal_plans do
    resources :planned_meals
  end

  resources :recipe_finders do
    resources :finder_ingredients
    get :autocomplete_for_ingredient_name, :on => :collection
  end
  
  resources :ingredients, :recipes

  root :to => "home#index"

  match "*path" => redirect("/")
end
