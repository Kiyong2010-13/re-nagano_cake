class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy

  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting_payment: 0, payment_confirmation: 1, making: 2, preparing_ship: 3, sent: 4 }
end
