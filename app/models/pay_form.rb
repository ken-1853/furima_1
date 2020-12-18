class PayForm
include ActiveModel::Model
attr_accessor :item_id, :token, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number, :user_id

  with_options presence: true do
    validates :item_id
    validates :token, presence: { message: "can't be blank" }
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
    validates :city
    validates :addresses
    validates :phone_number, length: { maximum: 11, message: 'Too long' }
    validates :user_id
  end

  def save
    # 保存する情報の中で、一番親に該当するものをまず保存する？
    order = Order.create(
      item_id: item_id,
      user_id: user_id
    )
    Address.create(
      # ↓一番重要！住所と注文情報を結びつけるために外部キーを指定。上記で新規作成したorderの情報をidで関連付ける
      order_id: order.id,
      postal_code: postal_code,
      prefecture_id: prefecture_id,
      city: city,
      addresses: addresses,
      building: building,
      phone_number: phone_number
    )
  end

end