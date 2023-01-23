class OrderShip
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :area_id, :city, :address, :building, :phone, :order_id, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code
    validates :area_id
    validates :city
    validates :address
    validates :phone
    validates :token
  end

  validates_format_of :post_code,  with: /\A\d{3}-\d{4}\z/, message:"はハイフンを使用して正しく入力してください", allow_blank: true
  validates_format_of :phone,      with: /\A\d{10,11}\z/, message:"が不正な値です。正しく入力してください。", allow_blank: true
  validates :area_id,              numericality: { other_than: 1, message: "を選択してください" }, allow_blank: true

  def save
    order = Order.create(user_id: user_id, item_id: item_id)     # 購入情報を保存して、変数orderに代入する
    # 住所を保存する
    # order_idには、変数orderのidと指定する
    Ship.create(post_code: post_code, area_id: area_id, city: city, address: address, building: building, phone: phone,
                order_id: order.id)
  end
end
