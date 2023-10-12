Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show]   do
    resources :posts, only: [:index, :new, :show] do
      resources :comments, only: [:new]
      resources :comments, only: [:create], path: "comments/new"
    end
    resources :posts, only: [:create], path: "posts/new"
  end
  root "users#index"
end
