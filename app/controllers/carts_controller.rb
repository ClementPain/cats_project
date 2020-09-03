class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :index, :destroy]
  authorize_resource
  
  
  def index
    @cart_total = 0
    @cart.line_cat_pictures.each { |item| @cart_total += item.quantity * item.cat_picture.price }
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
