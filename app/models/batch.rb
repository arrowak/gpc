class Batch < ActiveRecord::Base
  belongs_to :department
  has_many :documents
  has_many :users
  attr_accessible :active, :date_end, :date_start, :name, :department
end
