class AddMessageToChatMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :chat_messages, :message, :string
    add_column :chat_messages, :user_id, :integer
    add_column :chat_messages, :chat_room_id, :integer
  end
end
