FactoryBot.define do
  factory :recruitment do
    user_id { 1 }
    title { '助っ人募集＠多摩川河川敷' }
    body { '欠員が出たので募集中です' }
    category { '助っ人募集' }
    area { '東京都' }
    address { '東京都世田谷区多摩川１−１−１' }
    recruitments_number { 3 }
  end
end
