FactoryBot.define do
  factory :user do
    name { '筒香' }
    self_introduction { 'メジャーリーグ目指してます' }
    email { 'test@test.com' }
    password { 'testtest' }
  end
end
