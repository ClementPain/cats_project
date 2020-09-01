Rails.application.routes.draw do
  
  root 'cat_pictures#index'
  devise_for :users
  resources :cat_pictures
  resources :carts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
