class RenameColumnInChatTokens < ActiveRecord::Migration
  def up
  	rename_column :chat_tokens, :receipient_id, :recipient_id
  end

  def down
  end
end
