Rails.application.routes.draw do
  get 'carts/show'
  get 'carts/create'
  get 'carts/update'
  get 'carts/destroy'
  root 'cat_pictures#index'
  devise_for :users
  resources:cat_pictures
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
