class OrdersDetail < ApplicationRecord
    belongs_to :order
    belongs_to :cat_picture
end
