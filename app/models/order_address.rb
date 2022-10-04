class OrderAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :prefecture_id, :city, :address1, :address2, :number, :order_id, :token, :token

  with_options presence: true do
  validates :item_id
  validates :user_id
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city
  validates :address1
  validates :number, format: {with: /\A\d{10,11}\z/}
  validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2, number: number, order_id: order.id)
  end
end