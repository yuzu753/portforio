require 'rails_helper'

RSpec.describe ChatMessage, type: :model do
	# describe '#chatmessage 正常系の機能' do
	# 	context '登録する' do
	# 		it '正しく登録できること' do
	# 			message = FactoryBot.build(:chat_message)
	# 			expect(message).to be_valid
	# 			message.save

	# 			answered_message = ChatMessage.find_by(user_id: room.id);
	# 			expect(answered_message.message).to eq('テスト')
	# 			expect(answered_message.user_id).to eq(1)
	# 			expect(answered_message.chat_room_id).to eq(1)
	# 		end
	# 	end
	# end
end
