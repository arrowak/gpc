class RenameColumnChatTokenIdFromChats < ActiveRecord::Migration
  def up
  	rename_column :chats, :chat_token_id, :token_id
  end

  def down
  end
end
