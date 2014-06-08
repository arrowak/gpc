class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name
      t.integer :parentlabel
      t.references :labelable, polymorphic: true
      t.timestamps
    end
  end
end
