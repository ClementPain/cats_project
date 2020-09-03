class Order < ApplicationRecord
  after_create :confirmation_send, :notice_send
  

  belongs_to :user
  has_many :orders_details, dependent: :destroy
  has_many :cat_pictures, through: :orders_details

  def confirmation_send
    UserMailer.order_confirmation_email(self).deliver_now!
  end

  def notice_send
    UserMailer.order_notice_email(self).deliver_now!
  end
end
