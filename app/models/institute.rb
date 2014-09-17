class Institute < ActiveRecord::Base
  attr_accessible :address, :city, :contact_email, :contact_number, :contact_person, :name, :year_estd
  has_many :departments
end
