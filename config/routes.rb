Mabel::Application.routes.draw do |map|

  resources :meal_finders
  
  resources :meal_plans do
    resources :planned_meals do
      member do
        get :suggest
      end
    end
  end

  resources :ingredients

  resources :ingredient_amounts

  resources :recipes

end
