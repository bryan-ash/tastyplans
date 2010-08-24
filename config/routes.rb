Mabel::Application.routes.draw do

  resources :meal_plans do
    resources :planned_meals do
      member do
        get :suggest
      end
    end
  end

  resources :ingredients, :ingredient_amounts, :meal_finders, :recipes

end
