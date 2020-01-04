FactoryBot.define do
  factory :chat_message do
    message {'テスト'}
    user_id { 1 }
    chat_room_id { 1 }
  end
end
