class Admin::HomeController < ApplicationController
  layout "admin"
  before_action :authenticate_admin!
  def index
    @users = User.includes(:orders).order(created_at: :desc)
  end


end
