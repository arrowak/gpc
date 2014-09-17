class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  do_not_validate_attachment_file_type :avatar
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :contact_number, :avatar
  has_attached_file :avatar, :styles => {
      :thumb => "50x50#",
      :small  => "150x150>",
      :medium => "200x200"}, :default_url => "http://placehold.it/50x50"

  belongs_to :role
  belongs_to :batch
  has_many :documents
  has_many :chats

  def role? irole
  	self.role.name == irole.to_s
  end

  def fullname
    self.firstname + " " + self.lastname
  end
end
