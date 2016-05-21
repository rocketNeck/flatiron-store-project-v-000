# it "has many carts" do
# it "has a current_cart" do


class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :carts
  belongs_to :current_cart, :class_name => "Cart"

  # a cart remains "not submitted" as long as customer is still looking
  def set_current_cart
    cart = self.carts.build
    self.current_cart_id = cart.id
    save
  end

###"sets current_cart to nil on checkout"
  def after_checkout_cart
    self.current_cart_id = nil
    save
  end

end
