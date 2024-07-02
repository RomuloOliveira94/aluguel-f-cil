class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.where('period_end >= ?', Date.current).order(created_at: :desc)
  end
end
