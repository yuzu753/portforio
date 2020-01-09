require 'rails_helper'

RSpec.describe ChatMessage, type: :model do
	describe '#chatmessage 正常系の機能' do
		context '登録する' do
			it '正しく登録できること' do

				user = FactoryBot.build(:user)
				expect(user).to be_valid
				user.save

				chat_room = FactoryBot.build(:chat_room)
				expect(chat_room).to be_valid
				chat_room.save

				message = FactoryBot.build(:chat_message, user_id: user.id)
				expect(message).to be_valid
				message.save

				answered_message = ChatMessage.find_by(user_id: user.id);
				expect(answered_message.message).to eq('テスト')
				expect(answered_message.user_id).to eq(user.id)
				expect(answered_message.chat_room_id).to eq(chat_room.id)
			end
		end
	end

	describe 'バリデーション' do
		context '必須項目' do
			it 'メッセージが必須であること' do
               new_message = ChatMessage.new

               expect(new_message).not_to be_valid
               expect(new_message.errors[:message]).to include(I18n.t('errors.messages.blank'))
			end

            it '登録できないこと' do
               new_message = ChatMessage.new
               expect(new_message.save).to be_falsey
            end
		end
	end
end
