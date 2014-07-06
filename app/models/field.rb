class Field < ActiveRecord::Base

  TEXT_FIELD = 1
  RADIO_BUTTON_FIELD = 2
  CHECKBOX_FIELD = 3

  attr_accessible :category, :name, :options

  belongs_to :form

end
