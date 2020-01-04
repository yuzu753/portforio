require 'rails_helper'

RSpec.describe ChatRoom, type: :model do
	describe '#chat 正常系の機能' do
		context '登録する' do
			it '正しく登録できること' do

				room = FactoryBot.build(:chat_room)
				expect(room).to be_valid
				room.save

				answered_room = ChatRoom.find_by(id: room.id);
				expect(answered_room.id).to eq(room.id)
			end
		end
	end
end
