class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_path, notice: "Item removed"
  end
end