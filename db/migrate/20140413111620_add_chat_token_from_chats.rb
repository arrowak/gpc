class AddChatTokenFromChats < ActiveRecord::Migration
  def change
    add_column :chats, :chat_token, :string
  end
end
