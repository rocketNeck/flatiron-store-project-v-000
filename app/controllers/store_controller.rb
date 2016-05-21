class StoreController < ApplicationController
  before_filter :authenticate_user!
   def index
     @items =Item.available_items
     @categories = Category.all
   end
end
