Rails.application.routes.draw do
  resources :orders
  resources :contract_plans do
    post :buy
  end
  devise_for :users
  resources :users

  authenticated :user do
    root "contract_plans#index", as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
