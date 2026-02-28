class CartsController < ApplicationController
  before_action :authenticate_user!

  def add_item
    product = Product.find(params[:product_id])

    # جيب الكارت النشط أو اعمل واحد جديد
    cart = current_user.cart || current_user.create_cart(status: "active")

    # شوف لو المنتج موجود في الكارت
    cart_item = cart.cart_items.find_by(product_id: product.id)

    if cart_item
      # لو موجود → زود الكمية
      cart_item.quantity += 1
      cart_item.save
    else
      # لو مش موجود → أضفه
      cart.cart_items.create!(
        product: product,
        quantity: 1,
        price_at_time: product.price
      )
    end

    redirect_back fallback_location: root_path, notice: "Product added to cart"
  end

  def show
    @cart = current_user.cart
  end
end
