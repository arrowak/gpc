class Feedback < ActiveRecord::Base
  attr_accessible :answer, :field_id, :form_id, :user_id
end
