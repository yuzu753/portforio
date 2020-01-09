require 'rails_helper'

RSpec.describe ChatRoomUser, type: :model do
	describe '#chatroomuser 正常系の機能' do
		# context '登録できること' do
		# 	it '正しく登録できること' do

		# 		user = FactoryBot.build(:user)
		# 		expect(user).to be_valid
		# 		user.save

		# 		chat_room = FactoryBot.build(:chat_room)
		# 		expect(chat_room).to be_valid
		# 		chat_room.save

		# 		chat_room_user = FactoryBot.build(:chat_room_user, user_id: user.id)
		# 		expect(chat_room_user).to be_valid
		# 		chat_room_user.save

		# 		answered_enquete = ChatRoomUser.find_by(chat_room_id: chat_room.id);

		# 		expect(answered_enquete.user_id).to eq(user.id)
		# 		expect(answered_enquete.chat_room_id).to eq(chat_room.id)

		# 	end
		# end
	end
end
