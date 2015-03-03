Rails.application.routes.draw do
  get 'welcome/index'

  devise_for :users
  resources :workouts do
    resources :exercises
  end
  resources :users
  
  authenticated :user do
    root 'workouts#index', as: "authenticated_root"
  end
  
  root 'welcome#index'
  
  match 'users/:id' => 'users#show', via: :get
  
end
