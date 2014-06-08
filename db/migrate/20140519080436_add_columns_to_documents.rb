class AddColumnsToDocuments < ActiveRecord::Migration
  def change
  	add_column :documents, :labelable_id, :int
  	add_column :documents, :labelable_type, :string
  end
end
