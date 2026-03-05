class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy



  enum :status, {
    pending: 0,
    shipped: 1,
    delivered: 2,
    canceled: 3
  }
  validates :shipping_address, :phone_number, presence: true
end