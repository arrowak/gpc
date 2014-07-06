class Form < ActiveRecord::Base

  attr_accessible :name

  belongs_to :user
  has_many   :fields

end
