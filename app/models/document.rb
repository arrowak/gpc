class Document < ActiveRecord::Base
  belongs_to :batch
  belongs_to :user
  has_many :assets, as: :assetable
  accepts_nested_attributes_for :assets
  attr_accessible :description, :title, :batch, :user
  #attr_accessible :docfile
  #has_attached_file :docfile, :default_url => "http://placehold.it/70x70"
  #validates_attachment_content_type :docfile, :content_type => ["image/jpg", "image/jpeg", "image/png", "application/pdf"]
  #do_not_validate_attachment_file_type :docfile

end
