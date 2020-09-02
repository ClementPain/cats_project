class OrdersDetailsController < ApplicationController
end
class OrdersDetailsController < ApplicationController

  Dotenv.load

  def create
    Stripe.new.perform
end
end
