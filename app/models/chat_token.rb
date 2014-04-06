class ChatToken < ActiveRecord::Base
  attr_accessible :owner_id, :receipient_id, :status, :token
  belongs_to :chat
end
