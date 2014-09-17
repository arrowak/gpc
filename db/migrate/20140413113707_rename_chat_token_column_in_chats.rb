class RenameChatTokenColumnInChats < ActiveRecord::Migration
  def up
  	rename_column :chats, :chat_token, :chat_token_id
  end

  def down
  end
end
