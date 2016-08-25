Rails.application.routes.draw do
  devise_for :users
  root to: "rankings#index"
  get '/history', to: 'games#index'
  get '/log',     to: 'games#new'

  resources :games, only: [:show, :create]
  resources :rankings, only: [:index]
end
