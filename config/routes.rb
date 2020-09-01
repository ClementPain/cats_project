Rails.application.routes.draw do

  root 'cat_pictures#index'
  devise_for :users
  resources:cat_pictures
  
  resource :user do
    resources :carts, only: [:index, :create, :destroy]
  end

  resources :line_cat_pictures, only: [:create, :destroy]
end
