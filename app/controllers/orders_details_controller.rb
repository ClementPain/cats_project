require 'dotenv'

class OrdersDetailsController < ApplicationController

  Dotenv.load

  def create
    Stripe.new.perform
end
end
