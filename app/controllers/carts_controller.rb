class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :index, :destroy]
  authorize_resource
  
  
  def index
  end

  def new

  end

  def create
  end

  def show
    @cart = current_user.cart
  end

  def destroy
  end

  private
  def set_cart
    @cart = current_user.cart || @cart = Cart.create(user_id:current_user.id)
  end

end
