class ProductsController < ApplicationController
  before_action :set_product, only: [ :show, :edit, :update, :destroy ]

  # GET /products
  def index
    if params[:category]
      @category = Category.find_by(name: params[:category])

      if @category
        @products = @category.products
      else
        @products = Product.none
      end
    else
      @products = Product.none
    end
  end

  # GET /products/:id
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Product was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /products/:id/edit
  def edit
  end

  # PATCH/PUT /products/:id
  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Product was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /products/:id
  def destroy
    @product.destroy
    redirect_to products_url, notice: "Product was successfully destroyed."
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :stock_quantity, :category_id, :brand_id, :active)
  end
end
