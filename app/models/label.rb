class Label < ActiveRecord::Base
  attr_accessible :name, :parentlabel
  has_many :documents, as: :labelable
end
