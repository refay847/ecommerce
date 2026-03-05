class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    cart = current_user.cart



    if cart.cart_items.empty?
      redirect_to cart_path, alert: "Your cart is empty!"
      return
    end

    ActiveRecord::Base.transaction do
      order = current_user.orders.create!(
        order_params.merge(total_amount: cart.total_price)
      )

      cart.cart_items.each do |item|
        order.order_items.create!(
          product: item.product,
          quantity: item.quantity,
          price_at_purchase: item.product.price
        )
      end

      cart.cart_items.destroy_all
    end

    redirect_to root_path, notice: "Order placed successfully!"
  rescue ActiveRecord::RecordInvalid => e
    redirect_to cart_path, alert: "Checkout failed: #{e.message}"
  end










  def checkout
    @cart = current_user.cart
    @order = current_user.orders.build
  end


  private

  def order_params
    params.require(:order).permit(
      :name,
      :email,
      :description,
      :shipping_address,
      :phone_number
    )
  end
end
