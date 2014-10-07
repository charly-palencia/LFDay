Rails.application.routes.draw do
  root to: 'home#index'
  get '/play', to: 'play#play', as: 'play'
  resources :preferences, only: [:new, :index, :create]
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
