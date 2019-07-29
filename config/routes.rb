Rails.application.routes.draw do
  resources :participations
  resources :results
  resources :games
  resources :rank_pairs
  resources :courts
  resources :players
  resources :teams
  resources :ranks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
