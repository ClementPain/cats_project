class Order < ApplicationRecord
  after_create :confirmation_mail

  belongs_to :user
  has_many :orders_details, dependent: :destroy
  has_many :cat_pictures, through: :orders_details
end
