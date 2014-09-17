class AddColumnsToUsersTables < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :contact_number, :string
  end
end
