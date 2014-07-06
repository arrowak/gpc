class AddPublishedAndBatchIdToForms < ActiveRecord::Migration
  def change
    add_column :forms, :published, :boolean, :default => false
    add_column :forms, :batch_id, :integer

    add_index :forms, :published
    add_index :forms, :batch_id
  end
end
