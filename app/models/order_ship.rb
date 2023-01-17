class OrderShip
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :address, :building, :phone, :order_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :area_id,     numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone, format: {with: /\A\d{10,11}\z/}
    validates :order_id
  end

end