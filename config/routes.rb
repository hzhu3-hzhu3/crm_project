Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  get "up" => "rails/health#show", as: :rails_health_check

  root 'customers#index'

  get '/customers/alphabetized', to: 'customers#alphabetized', as: 'customers_alphabetized'
  get '/customers/missing_email', to: 'customers#missing_email', as: 'customers_missing_email'

  resources :customers, only: [:index]

  ActiveAdmin.routes(self)
end
