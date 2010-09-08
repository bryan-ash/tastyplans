Mabel::Application.routes.draw do

  devise_for :users

  root :to => "home#index"
  
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
  
  resources :ingredients, :ingredient_amounts, :recipes

end
