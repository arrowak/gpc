class AddColumnToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :assetable_name, :string
  end
end
