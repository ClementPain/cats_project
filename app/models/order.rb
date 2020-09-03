class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_details, dependent: :destroy
  has_many :cat_pictures, through: :orders_details
end
