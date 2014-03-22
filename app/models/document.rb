class Document < ActiveRecord::Base
  belongs_to :batch
  belongs_to :user
  has_many :assets, as: :assetable, :dependent => :destroy
  accepts_nested_attributes_for :assets, :reject_if => lambda { |a| a[:afile].blank? }, :allow_destroy => true
  attr_accessible :description, :title, :batch, :user, :assets_attributes 
 
  include PublicActivity::Common
end
