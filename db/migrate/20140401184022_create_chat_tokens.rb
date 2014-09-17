class CreateChatTokens < ActiveRecord::Migration
  def change
    create_table :chat_tokens do |t|
      t.string :token
      t.integer :owner_id
      t.integer :receipient_id
      t.integer :status

      t.timestamps
    end
  end
end
