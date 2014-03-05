class Batch < ActiveRecord::Base
  belongs_to :department
  has_many :documents
  attr_accessible :active, :date_end, :date_start, :name, :department
end
