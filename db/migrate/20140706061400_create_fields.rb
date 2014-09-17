class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.string :name
      t.integer :form_id
      t.integer :category
      t.text :options

      t.timestamps
    end

    add_index :fields, :form_id
  end
end
