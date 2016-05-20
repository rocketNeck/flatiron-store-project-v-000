class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:title])
  end
end
