class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :recruitments
  has_many :chat_room_users
  has_many :chat_rooms, { through: :chat_room_users }
  has_many :chat_messages
  attachment :profile_image

end
