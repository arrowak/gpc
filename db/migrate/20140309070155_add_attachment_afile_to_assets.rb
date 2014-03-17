class AddAttachmentAfileToAssets < ActiveRecord::Migration
  def self.up
    change_table :assets do |t|
      t.attachment :afile
    end
  end

  def self.down
    drop_attached_file :assets, :afile
  end
end
