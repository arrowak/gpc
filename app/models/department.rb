class Department < ActiveRecord::Base
  belongs_to :institute
  attr_accessible :name
end
