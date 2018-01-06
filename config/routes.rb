Rails.application.routes.draw do
  resources :orders
  resources :contract_plans
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
