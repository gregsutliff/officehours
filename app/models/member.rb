class Member < ActiveRecord::Base
  validates :firstname, :lastname, :uin, :presence => true
  validates :uin, :uniqueness => true
  belongs_to :office
	has_one :building, :through => :office
  has_many :office_hours, dependent: :destroy

	def fullname
		firstname + " " + lastname
	end
end
