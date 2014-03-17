class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :title
      t.text :description
      t.references :assetable

      t.timestamps
    end
    add_index :assets, :assetable_id
  end
end
