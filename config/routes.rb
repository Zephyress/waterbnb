Rails.application.routes.draw do
  devise_for :users do
    get 'dashboard', to: 'bookings#index'
  end

  root to: 'boats#index'
  resources :boats do
    resources :bookings, only: [:create, :new]
  end

  resources :bookings, only: [:index, :show]

  # POST 'pages/login', to: 'pages#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
