class RenameColumnInChats < ActiveRecord::Migration
  def up
  	rename_column :chats, :recipient_ids, :chat_token
  end

  def down
  end
end
