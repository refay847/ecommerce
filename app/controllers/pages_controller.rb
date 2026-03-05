class PagesController < ApplicationController
  layout false, only: [ :home ]
  def home
    @categories = Category.all
  end

  def about
  end

  def news
  end

  def contact
  end

  def single_news
  end

  def single_product
  end

 

  def error_404
  end
end
