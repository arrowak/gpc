class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :message
      t.references :user
      t.references :batch

      t.timestamps
    end
    add_index :announcements, :user_id
    add_index :announcements, :batch_id
  end
end
