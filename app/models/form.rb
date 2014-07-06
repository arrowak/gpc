class Form < ActiveRecord::Base

  attr_accessible :name

  belongs_to :user
  belongs_to :batch
  has_many   :fields

  def published?
    self.published
  end

end
