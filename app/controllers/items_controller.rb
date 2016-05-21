class ItemsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @item = Item.find(params[:title])
  end
end
