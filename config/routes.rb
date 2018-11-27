Rails.application.routes.draw do

  get 'users/show'
  devise_for :users, :controllers => { :registrations => :registrations }

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

  get '/profile', to: 'users#show', as: 'profile'
end
