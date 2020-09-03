class User < ApplicationRecord

  after_create :welcome_send

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one:cart
  has_many:orders
  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end
end
