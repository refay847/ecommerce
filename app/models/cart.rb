class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_items, dependent: :destroy

  validates :status, inclusion: { in: %w[active ordered] }
end
