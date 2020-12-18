FactoryBot.define do
  factory :user do

    # fakerの使用は一意性のあるものだけで問題ない

    nickname { Faker::Internet.username }
    password { '1a' + Faker::Internet.password(min_length: 7, max_length: 20) } #'1a'とすることで、英数字どちらも最低限使われるようにしている
    email { Faker::Internet.email }
    birth_date { Faker::Date.between_except(from: 20.year.ago, to: 1.year.from_now, excepted: Date.today) }  # 誕生日は一意性ではないよ
    first_name { '田中' }
    last_name { '太郎' }
    first_name_kana { 'タナカ' }
    last_name_kana { 'タロウ' }
    
  end
end
