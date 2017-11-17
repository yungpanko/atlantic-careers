Rails.application.routes.draw do
  resources :applications
  resources :jobs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "companies#index"
  get "/login" => "sessions#new", as: :login
  post "/login" => "sessions#create", as: :sessions
  get "/users/new" => "users#new", as: :signup
  get "/users/:id" => "users#show", as: :user
  get "/users" => "users#index"
  post "/users" => "users#create"
  get "/users/:id/edit" => "users#edit", as: :edit_user
  put "/users/:id" => "users#update"
  patch "/users/:id" => "users#update"
  delete "/logout" => "sessions#destroy"
  delete "/users/:id" => "users#destroy"

  resources :companies

end
