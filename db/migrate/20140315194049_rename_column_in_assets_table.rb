class RenameColumnInAssetsTable < ActiveRecord::Migration
  def up
  	 rename_column :assets, :assetable_name, :assetable_type
  end

  def down
  end
end
