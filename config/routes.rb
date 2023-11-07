Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show]   do
    resources :posts, only: [:index, :new, :create, :show] do
      get '/page/:page', action: :index, on: :collection
      resources :likes, only: [:create], path: ""
      resources :likes, only: [:destroy], path: ""
      resources :comments, only: [:create], path: "comment"
    end
  end
  root "users#index"
end
