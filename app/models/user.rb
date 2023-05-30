class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
    has_many :user_rooms
    has_many :chat_rooms, through: :user_rooms
end
