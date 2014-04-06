class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats do |t|
      t.text :content
      t.integer :owner_id
      t.text :recipient_ids

      t.timestamps
    end
  end
end
