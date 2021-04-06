Rails.application.routes.draw do
  root to: 'teams#index'
  get 'start', to: 'teams#start_division', as: 'start'
  get 'go_tournament', to: 'teams#go_tournament', as: 'go'
  resources :teams
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
