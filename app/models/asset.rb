class Asset < ActiveRecord::Base
  belongs_to :assetable, :polymorphic => true
  attr_accessible :afile
  has_attached_file :afile,:default_url => "http://placehold.it/100x100"
  do_not_validate_attachment_file_type :afile
end
