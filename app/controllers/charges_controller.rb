class ChargesController < ApplicationController
  def new
    @amount = current_user.cart.cat_pictures.sum(:price)
  end
  
  def create
    # Amount in cents
    @amount = (current_user.cart.cat_pictures.sum(:price)*100).to_i
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
    
    # créer une commande liée au client
    @order=Order.create(user:current_user)
    @order_details = current_user.cart.cat_pictures
    
    # créer x éléments de la commande en récupérant les éléments du panier
    @order_details.each do |image|
        OrdersDetail.create(order:@order, cat_picture:image)
    end
    
    #détruire le panier
    current_user.cart.line_cat_pictures.destroy
    current_user.cart.destroy

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end