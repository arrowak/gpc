class CreateBatches < ActiveRecord::Migration
  def change
    create_table :batches do |t|
      t.string :name
      t.string :date_start
      t.string :date_end
      t.references :department
      t.integer :active

      t.timestamps
    end
    add_index :batches, :department_id
  end
end
