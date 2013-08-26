Mabel::Application.routes.draw do

  devise_for :users,
  :controllers => {
    :invitations   => "users/invitations",
    :passwords     => "users/passwords",
    :registrations => "users/registrations",
    :sessions      => "users/sessions"
  }

  namespace :users do
    resources :beta_requests, :only => [:index, :new, :create] do
      put :invite, :on => :member
    end
  end

  namespace :admin do 
    resources :users
  end

  resources :ingredients
  
  resources :meal_plans, :except => :show do
    resources :planned_meals
    resource :shopping_list, :only => :show
  end

  get "current_meal_plan/add_recipe/:id" => "current_meal_plan#add_recipe", :as => :current_meal_plan_add_recipe
  get "current_meal_plan/edit"           => "current_meal_plan#edit",       :as => :edit_current_meal_plan
  
  resources :recipes do
    get :autocomplete_for_ingredient_amount_unit, :on => :collection
    get :autocomplete_for_ingredient_name,        :on => :collection
    get :autocomplete_for_recipe_name,            :on => :collection
  end

  resources :recipe_finders, :only => [:new, :show, :update] do
    resources :finder_ingredients
    get :autocomplete_for_ingredient_name, :on => :collection
  end

  root :to => "home#index"

  get "*path" => "home#error"
end
