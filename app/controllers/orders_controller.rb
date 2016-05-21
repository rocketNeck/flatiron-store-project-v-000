class OrdersController < ApplicationController
  before_filter :authenticate_user!
  def show
    @order = Order.find(params[:id])
  end
end
