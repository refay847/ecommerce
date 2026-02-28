class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :image_path, presence: true
  has_many :products, dependent: :destroy
end
