# it "has many carts" do
# it "has a current_cart" do


class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :carts
  belongs_to :current_cart, :class_name => "Cart"

  # a cart remains "not submitted" as long as customer is still looking
  def current_cart
    carts.where(status: "not submitted").first
  end

###"sets current_cart to nil on checkout"
  def kill_cart
    self.current_cart_id = nil
    save
  end

end
