Rails.application.routes.draw do

  root 'cat_pictures#index'
  get 'pages/about_us', to: 'pages#about_us'

  devise_for :users
  resources:cat_pictures
  
  resource :user do
    resources :carts, only: [:index, :create, :destroy]
    resources :orders
  end

  resources :line_cat_pictures, only: [:create, :destroy]
end