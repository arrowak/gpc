class Form < ActiveRecord::Base

  attr_accessible :name

  belongs_to :user
  belongs_to :batch
  has_many   :fields

  def published?
    self.published
  end

  def submitted?(user)
    # This looks a bad way. Need to think of a better solution.
    fields = self.fields.map{ |field| field.id }
    feedback = Feedback.where(:user_id => user, :field_id => fields)
    unless(feedback.empty?)
      feedback_ids = feedback.map{ |f| f.field_id }
      if((feedback_ids - fields).empty?)
        return true
      else
        return false
      end
    end

    return false
  end

end
