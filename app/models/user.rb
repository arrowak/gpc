class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :contact_number
  has_attached_file :avatar

  belongs_to :role
  has_many :documents

  def role? irole
  	self.role.name == irole.to_s
  end
end
