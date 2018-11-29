Rails.application.routes.draw do

  get 'users/show'
  devise_for :users, :controllers => { :registrations => :registrations }

  root to: 'pages#home'

  resources :rooms do
    member do
      get 'bookings', to: 'rooms#bookings'
    end

    resources :room_images, only: [:destroy]
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:index, :show, :destroy, :update]

  get '/profile', to: 'users#show', as: 'profile'

  get '/my_rooms', to: 'rooms#myrooms', as: 'my_rooms'

end
