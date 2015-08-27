class Member < ActiveRecord::Base
  validates :firstname, :lastname, :uin, :presence => true
  validates :uin, :uniqueness => true
  belongs_to :office
	belongs_to :department
	has_one :building, :through => :office
  has_many :office_hours, dependent: :destroy
	delegate :name, :to => :department, :prefix => true

	def fullname
		firstname + " " + lastname
	end
end
