class AddColmnToChatRoomUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_room_users, :user_id, :integer
    add_column :chat_room_users, :chat_room_id, :integer
  end
end
