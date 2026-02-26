class Product < ApplicationRecord
    belongs_to :category

  validates :name, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock_quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # optional helper to get image URL
  def image_url
    image_path.presence || "default-product.jpg"
  end
end
