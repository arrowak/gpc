class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name
      t.references :institute

      t.timestamps
    end
    add_index :departments, :institute_id
  end
end
