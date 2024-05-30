Rails.application.routes.draw do
  devise_for :users
  resources :customers
  resources :equipaments

  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'customers#index'
end
