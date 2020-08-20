Rails.application.routes.draw do
  devise_for :users
  root to: 'boats#index'
  resources :boats do
    resources :bookings, only: [:create, :new]
  end
  get 'index2', to: 'boats#index2'
  get "answer", to: "questions#answer"
  # POST 'pages/login', to: 'pages#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
