class CartsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @cart = current_cart
  end

  def checkout 
    @cart = Cart.find(params[:id])
    @cart.checkout_cart
    redirect_to cart_path(@cart)
  end


end
