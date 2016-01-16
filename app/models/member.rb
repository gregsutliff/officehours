class Member < ActiveRecord::Base
  validates :firstname, :lastname, :uin, presence: true
  validates :uin, uniqueness: true
  belongs_to :office
	belongs_to :department
	has_one :email
	has_one :building, through: :office
  has_many :office_hours, dependent: :destroy

	delegate :name, to: :department, prefix: true
	delegate :fullname, to: :building, prefix: true
	delegate :name, to: :office, prefix: true
	delegate :uic_email, to: :email, allow_nil: true
	delegate :non_uic_email, to: :email, allow_nil: true

	def fullname
		firstname + ' ' + lastname
	end
end
