Rails.application.routes.draw do
  resources :coffee_shops
  resources :coffee_tables
  devise_for :users
end
