Rails.application.routes.draw do

  get 'sessions/new'

  root "products#index"
  resources	:users, except: :index
  resources :products
  resource :session, only: [:new, :create, :destroy]

end
