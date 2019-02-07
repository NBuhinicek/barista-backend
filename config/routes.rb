Rails.application.routes.draw do
  resources :coffee_shops
  resources :coffee_tables
  devise_for :users

  get '/qr_code/:hash', to: 'coffee_tables#qr_code'

  root to: 'coffee_shops#index'
end
