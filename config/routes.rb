Rails.application.routes.draw do
  root to: 'teams#index'
  get 'to_division', to: 'teams#to_division', as: 'to_division'
  get 'start_tournament', to: 'teams#start_tournament', as: 'start'
  get 'show_all_statistics', to: 'teams#show_all_statistics', as: 'show_all_statistics'
  get 'show_division_stat', to: 'teams#show_division_stat', as: 'show_division_stat'
  get 'show_playoff_stat', to: 'teams#show_playoff_stat', as: 'show_playoff_stat'
  get 'show_semifinal_stat', to: 'teams#show_semifinal_stat', as: 'show_semifinal_stat'
  get 'show_final_stat', to: 'teams#show_final_stat', as: 'show_final_stat'
  resources :teams
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
