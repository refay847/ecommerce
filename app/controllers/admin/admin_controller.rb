class Admin::AdminController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  def index
    @categories = Category.all
     @products = Product.all
  end

  def orders
    @orders = Order.all
  end
end
