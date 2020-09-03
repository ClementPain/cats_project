Rails.application.routes.draw do

  root 'cat_pictures#index'
  get 'pages/about_us', to: 'pages#about_us'

  devise_for :users
  resources :cat_pictures, path: :chat
  
  resource :user, only: [:edit, :show, :update], path: :mon_profil do
    resources :carts, path: :mon_panier
    resources :orders, only: [:index, :show, :create, :destroy]
  end

  resources :line_cat_pictures, only: [:create, :destroy]

  resources :charges, only: [:new, :create], paths: :paiement
end