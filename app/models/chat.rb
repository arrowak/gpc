class Chat < ActiveRecord::Base
  attr_accessible :content, :owner_id, :recipient_ids
  belongs_to :owner, class_name: "User"
  belongs_to :recipient, class_name: "User"
  has_many :chat_tokens
end
