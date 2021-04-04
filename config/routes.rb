Rails.application.routes.draw do
  root to: 'teams#index'
  get 'start', to: 'teams#start_game', as: 'start'
  resources :teams
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
