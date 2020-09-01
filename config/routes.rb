Rails.application.routes.draw do
  root 'cat_pictures#index'
  devise_for :users
  resources:cat_pictures
  
  resource :user do
    resources:carts
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
