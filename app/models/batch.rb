class Batch < ActiveRecord::Base
  belongs_to :department
  attr_accessible :active, :date_end, :date_start, :name
end
