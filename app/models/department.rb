class Department < ActiveRecord::Base
  belongs_to :institute
  has_many :batches
  attr_accessible :name,:institute
end
