Rails.application.routes.draw do

  devise_for :users

  root to: 'pages#home'

  resources :rooms do
    collection do
      get 'search'
    end

    member do
      get 'bookings', to: 'rooms#bookings'
    end

    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :destroy]
end
