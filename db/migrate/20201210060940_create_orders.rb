class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
