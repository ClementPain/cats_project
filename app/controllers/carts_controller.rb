class CartsController < ApplicationController
  def index
    @cart = Cart.find_by(user_id:current_user.id) || @cart = Cart.create(user_id:current_user.id)
  end

  def create
  end

  def destroy
  end
end
