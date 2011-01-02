Mabel::Application.routes.draw do

  devise_for :users

  resources :ingredients

  resources :meal_plans do
    resources :planned_meals
  end

  match "current_meal_plan/edit"           => "current_meal_plan#edit",       :as => :edit_current_meal_plan
  match "current_meal_plan/add_recipe/:id" => "current_meal_plan#add_recipe", :as => :current_meal_plan_add_recipe
  
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
