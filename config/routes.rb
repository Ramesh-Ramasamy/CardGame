Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'player/index'

  resources :game
  resources :player
  root 'player#new'
end
