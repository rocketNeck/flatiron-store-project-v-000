# it "has many carts" do
#   @user.carts.create
#   expect(@user.carts.count).to eq(1)
# end
#
# it "has a current_cart" do
#   @user.current_cart = @user.carts.create
#   expect(@user.current_cart).to be_a(Cart)
# end



class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable

  has_many :carts
  belongs_to :current_cart, :class_name => "Cart"

  def current_cart
    carts.where(status: "not submitted").first
  end

###"sets current_cart to nil on checkout"
  def kill_cart
    self.current_cart_id = nil
    save
  end

end
