class RemoveColumnFromLabels < ActiveRecord::Migration
  def up
    remove_column :labels, :labelable_id
    remove_column :labels, :labelable_type
  end

  def down
    add_column :labels, :labelable_id, :int
    add_column :labels, :labelable_type, :string
  end
end
