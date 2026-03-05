class Admin::AdminController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  def index
    @categories = Category.all
     @products = Product.all

    if params[:category].present?
      @selected_category = Category.find_by(name: params[:category])
      @products = @selected_category&.products&.where(active: true) || []
    else
      @products = Product.includes(:category).where(active: true)
    end
  end

  def orders
    @orders = Order.all
  end
end
