class RemoveChatTokenFromChats < ActiveRecord::Migration
  def up
    remove_column :chats, :chat_token
  end

  def down
    add_column :chats, :chat_token, :string
  end
end
