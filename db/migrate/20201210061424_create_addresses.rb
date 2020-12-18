class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city, null: false
      t.string :addresses, null: false
      t.string :building
      t.string :phone_number

      t.references :order, foreign_key: true
      # 購入者と住所の情報を一括で渡すため、外部キーでorderを指定
      
      t.timestamps
    end
  end
end
