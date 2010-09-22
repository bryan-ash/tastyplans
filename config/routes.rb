Mabel::Application.routes.draw do

  devise_for :users

  resources :meal_plans do
    resources :planned_meals do
      member do
        get :suggest
      end
    end
  end

  resources :recipe_finders do
    resources :finder_ingredients
  end
  
  resources :ingredients, :recipes

  match "about",   :to => "home#about"
  match "contact", :to => "contact#new"
  
  root :to => "home#index"

  match "*path" => redirect("/")
  
end
