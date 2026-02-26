class PagesController < ApplicationController
  before_action :authenticate_user!, only: [ :cart, :checkout ]
  layout false, only: [ :home ]
  def home
    @categories = Category.all
  end

  def about
  end

  def shop
  end

  def news
  end

  def contact
  end

  def single_news
  end

  def single_product
  end

  def cart
  end

  def checkout
  end

  def error_404
  end
end
