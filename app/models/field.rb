class Field < ActiveRecord::Base

  attr_accessible :category, :name, :options

  belongs_to :form

end
