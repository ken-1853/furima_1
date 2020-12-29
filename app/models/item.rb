class Item < ApplicationRecord

  #空の投稿を保存できないようにする
  validates :image, :name, :info, :price, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, numericality: { other_than: 0 } 
  
  # 価格のバリデーションを設定する
  validates :price, inclusion: { in: 300..9999999, message: 'Out of setting range'}    

  belongs_to :user
  has_one :order
  # アクティブストレージとのアソシエーション
  has_one_attached :image

  # アクティブハッシュとのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery

end
