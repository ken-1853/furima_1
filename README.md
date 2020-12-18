# README


## Userテーブル
|Column                 |Type         |Options    |
|-----------------------|-------------|-------    |
|nickname               |string       |null: false|
|birth_date             |date         |null: false|
|email                  |string       |null: false|
|encrypted_password     |string       |null: false|
|first_name             |string       |null: false|
|first_name_kana        |string       |null: false|
|last_name              |string       |null: false|
|last_name_kana         |string       |null: false|
|remember_created_at    |datetime(0,0)|null: false|
|reset_password_sent_at |datetime(0,0)|null: false|
|reset_password_token   |string       |null: false|

### Association
has_many :items
has_many :itemTransaction



## Itemテーブル
|Column                |Type   |Options           |
|----------------------|----   |-------           |
|category_id           |integer|null: false       |
|info                  |text   |null: false       |
|name                  |string |null: false       |
|prefecture_id         |integer|null: false       |
|price                 |integer|null: false       |
|sales_status_id       |integer|null: false       |
|scheduled_delivery_id |integer|null: false       |
|shipping_fee_status_id|integer|null: false       |
|user_id(FK)           |integer|foreign_key: true |

### Association
belongs_to :user
has_one :itemTransaction


## Orderテーブル
|Column      |Type   |Options            |
|------------|-------|-------------------|
|item_id(FK) |integer| foreign_key: true |
|user_id(FK) |integer| foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :Address

## Addressテーブル
|Column      |Type   |Options          | 
|------------|-------|-----------------|
|addresses   |string |null: false      |
|building    |string |null: false      |
|city        |string |null: false      |
|phone_number|string |null: false      |
|postal_code |integer|null: false      |
|prefecture  |integer|null: false      |
|item_id(FK) |integer|foreign_key: true|

### Association
belongs_to :Order
