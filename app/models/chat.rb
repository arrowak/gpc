class Chat < ActiveRecord::Base
  attr_accessible :content, :token_id
  belongs_to :token, class_name: "ChatToken"
end
