Rails.application.routes.draw do
  resources :orders do
    member do
      post :confirm
    end
  end
  resources :contract_plans
  devise_for :users
  resources :users

  authenticated :user do
    root "contract_plans#index", as: :authenticated_root
  end

  devise_scope :user do
    root to: "devise/sessions#new"
  end
end
