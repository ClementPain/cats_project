class ChargesController < ApplicationController
  before_action :set_amount, only: [:new, :create]

  def new
  end
  
  def create
    # Amount in cents
    @amount_stripe = (@amount*100).to_i
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount_stripe,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
    
    # créer une commande liée au client
    @order=Order.new(user:current_user, amount:@amount)
    @order_details = current_user.cart.cat_pictures
    
    # créer x éléments de la commande en récupérant les éléments du panier
    @order_details.each do |image|
        OrdersDetail.create(order:@order, cat_picture:image)
    end
    
    @order.save

    #détruire le panier
    current_user.cart.line_cat_pictures.destroy
    current_user.cart.destroy

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
  def set_amount
    @amount = 0
    current_user.cart.line_cat_pictures.each { |item| @amount += item.quantity * item.cat_picture.price }
  end
end