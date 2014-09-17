class RemoveColumnFromChats < ActiveRecord::Migration
  def up
    remove_column :chats, :owner_id
  end

  def down
    add_column :chats, :owner_id, :string
  end
end
