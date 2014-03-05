class Document < ActiveRecord::Base
  belongs_to :batch
  belongs_to :user
  attr_accessible :description, :title
end
