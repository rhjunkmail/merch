Rails.application.routes.draw do

  root "products#index"
  resources	:users, except: :index
  resources :products


end
