FactoryBot.define do
  factory :pay_form do
    token { 'sampletoken123456' }
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    addresses { '1-1' }
    phone_number { '09012345678' }

    # ↓いらない。
    # association :user
    # association :item
  end
end