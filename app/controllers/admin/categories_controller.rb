class Admin::CategoriesController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path, notice: "Category created successfully"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, notice: "Category updated successfully"
    else
      render :edit
    end
  end

  def destroy
    @category.products.update_all(active: false)
    @category.update(active: false)
    redirect_to admin_categories_path, notice: "Category and its products are now inactive"
  end

  def toggle_active
    @category = Category.find(params[:id])
    @category.update(active: !@category.active)

    # عند تعطيل الفئة، نجعل كل منتجاتها inactive
    @category.products.update_all(active: @category.active)

    redirect_to admin_categories_path, notice: "Category and its products have been updated."
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name , :image_path, :active)
  end
end