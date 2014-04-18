class ChatToken < ActiveRecord::Base
  attr_accessible :owner_id, :recipient_id, :status, :token
  belongs_to :owner, class_name: "User"
  belongs_to :recipient, class_name: "User"
  has_many :chats
end
