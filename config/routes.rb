Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root to: "toppages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "setteings", to: "users#edit"
  get "dashborad", to: "users#show"
  get "signup", to: "users#new"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :users, only: [:show,:new,:create,:edit,:update,:destroy]
end
