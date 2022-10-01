class OrderAddress
  include ActiveModel::Model
  attr_accessor :item, :user, :post_code, :prefecture_id, :city, :address1, :address2, :number, :order

  with_options presence: true do
  validates :item
  validates :user
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :post_code
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :city
  validates :address1
  validates :number, format: {with: /\A\d{10,11}\z/}
  end

  def save
    order = Order.create(item: item, user: user)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address1: address1, address2: address2, number: number, order_id: order.id)
  end
end