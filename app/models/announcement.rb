class Announcement < ActiveRecord::Base
  belongs_to :user
  belongs_to :batch
  attr_accessible :message
  has_many :assets, as: :assetable, :dependent => :destroy
  accepts_nested_attributes_for :assets, :reject_if => lambda { |a| a[:afile].blank? }, :allow_destroy => true
  attr_accessible :assets_attributes 
  include PublicActivity::Common
end
