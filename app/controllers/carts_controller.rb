class CartsController < ApplicationController
  before_action :authenticate_user!

def add_item
  product = Product.find(params[:product_id])

  quantity = params[:quantity].to_i
  quantity = 1 if quantity <= 0

  cart = current_user.cart || current_user.create_cart(status: "active")

  cart_item = cart.cart_items.find_by(product_id: product.id)

  if cart_item
    cart_item.quantity += quantity
    cart_item.save
  else
    cart.cart_items.create!(
      product: product,
      quantity: quantity,
      price_at_time: product.price
    )
  end

  redirect_back fallback_location: root_path, notice: "Product added to cart"
end

  def show
    @cart = current_user.cart
  end
end
