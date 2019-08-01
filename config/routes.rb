Rails.application.routes.draw do

  root to: 'homes#home'

  resources :participations
  resources :results
  resources :games
  resources :rank_pairs
  resources :courts
  resources :players
  resources :teams
  resources :ranks

  post "/login", to: "sessions#login"
  get '/logout', to: "sessions#destroy"

end
