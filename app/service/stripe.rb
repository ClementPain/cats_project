require 'dotenv'

class Stripe

  Dotenv.load

def perform
    # Amount in cents
    @amount = OrdersDetail.find(params[:order_detail_id]).cat_pictures.sum(:price) * 100
    
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_attendance_path(params[:event_id])
  end
end