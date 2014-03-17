class Announcement < ActiveRecord::Base
  belongs_to :user
  belongs_to :batch
  attr_accessible :message
  has_many :assets, as: :assetable
end
