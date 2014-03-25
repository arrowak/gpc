class Chat < ActiveRecord::Base
  attr_accessible :content, :owner_id, :recipient_ids
end
