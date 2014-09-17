class RemoveColumnsFromAssets < ActiveRecord::Migration
  def up
    remove_column :assets, :description
    remove_column :assets, :title
  end

  def down
    
  end
end
