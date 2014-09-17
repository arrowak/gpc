class CreateInstitutes < ActiveRecord::Migration
  def change
    create_table :institutes do |t|
      t.string :name
      t.string :city
      t.string :contact_number
      t.string :contact_person
      t.string :contact_email
      t.text :address
      t.integer :year_estd

      t.timestamps
    end
  end
end
