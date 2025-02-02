Rails.application.routes.draw do
  root to: 'coffee_shops#index'

  namespace :api do
    namespace :v1 do
      resource :session, only: [:create, :destroy]
      resources :users, except: [:new, :edit] do
        get '/check_email', to: 'users#check_email', on: :collection
        post '/resend_confirmation', to: 'users#resend_confirmation', on: :collection
        post '/reset_password', to: 'users#reset_password', on: :collection
      end
      resources :locations, only: :index
      resources :qr_codes do
        get '/find_table/:hash', to: 'qr_codes#find_table', on: :collection
      end
    end
  end

  resources :coffee_shops
  resources :coffee_tables
  devise_for :users, controllers: {
    registrations: 'registrations',
    sessions: 'sessions',
    confirmations: 'confirmations'
  }
end
