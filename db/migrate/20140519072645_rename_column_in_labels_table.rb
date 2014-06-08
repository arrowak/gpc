class RenameColumnInLabelsTable < ActiveRecord::Migration
  def up
  	rename_column :labels, :parentlabel, :parentlabel_id
  end

  def down
  end
end
