#   has_many, has_one and belongs_to associations support the :dependent option. This allows you to specify that associated records should be deleted when the owner is deleted.
#
# For example:
#
# class Author
#   has_many :posts, dependent: :destroy
# end
# Author.find(1).destroy # => Will destroy all of the author's posts, too
# The :dependent option can have different values which specify how the deletion is done. For more information, see the documentation for this option on the different specific association types. When no option is given, the behavior is to do nothing with the associated records when destroying a record.
#
# Note that :dependent is implemented using Rails' callback system, which works by processing callbacks in order. Therefore, other callbacks declared either before or after the :dependent option can affect what it does.


class Cart < ActiveRecord::Base


  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  belongs_to :user

### it 'has many line_items built through instance method' do

### it 'creates a new unsaved line_item for new item'
###  it 'creates an appropriate line_item' do
###it 'updates existing line_item instead of making new when adding same item' do
  def add_item(item_id)
    if line_item = line_items.find_by(item_id: item_id)
      line_item.quantity += 1
    else
      line_item = line_items.build(item_id: item_id)
    end
    line_item
  end


  # it 'can calculate its total' do
  #   Item.second.line_items.create(quantity: 1, cart: @cart)
  #   expect(@cart.total).to eq(@item.price + Item.second.price)
  # end

  def total
    total = 0
    line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    total
  end


  def checkout
    status = "submitted"
    line_items.each do |line_item|
      line_item.item.inventory -= line_item.quantity
      line_item.item.save
    end
  end
end
