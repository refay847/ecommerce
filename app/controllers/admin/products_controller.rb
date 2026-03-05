class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!

  def index
    @categories = Category.all
    @products = Product.includes(:category)
    if params[:category].present?
      @products = Product.joins(:category).where(categories: { name: params[:category] })
    else
      @products = Product.includes(:category).all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path, notice: "Product created successfully"
    else
      @categories = Category.all
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path, notice: "Product updated"
    else
      @categories = Category.all
      render :edit
    end
  end

  def toggle_active
    @product = Product.find(params[:id])

    @product.update(active: !@product.active)

    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock_quantity, :category_id, :image_path, :active)
  end
end
