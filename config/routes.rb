Rails.application.routes.draw do

  # get 'orders/new'

  # get 'orders/index'

  # get 'orders/show'

  #get 'sessions/new'

  root "products#index"
  resources	:users, except: :index do
    resources :orders, only: [:show, :index]
  end

  resources :products do
  	resources :orders, only: [:new, :create]
  end
  resource :session, only: [:new, :create, :destroy]

end
