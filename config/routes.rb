Rails.application.routes.draw do
  get 'watchlists/create'
  get 'watchlists/destroy'
  root to: "toppages#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "dashborad", to: "users#show"
  get "signup", to: "users#new"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  get "search", to: "stocks#index"
  resources :users, only: [:show,:new,:create,:edit,:update,:destroy]
  resources :stocks, only: [:show, :new, :create, :destroy]
  resources :comments, only: [:create,:update,:destroy]
  resources :watchlists, only: [:create, :destroy]
end
