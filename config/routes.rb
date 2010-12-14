Mabel::Application.routes.draw do

  devise_for :users

  resources :ingredients

  resources :meal_plans do
    resources :planned_meals
  end

  resources :recipes do
    get :autocomplete_for_ingredient_name, :on => :collection
  end

  resources :recipe_finders do
    resources :finder_ingredients
    get :autocomplete_for_ingredient_name, :on => :collection
  end
  
  root :to => "home#index"

  match "*path" => redirect("/")
end
