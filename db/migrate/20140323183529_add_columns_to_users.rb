class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :batch_id, :integer
  end
end
