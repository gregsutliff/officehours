class Member < ActiveRecord::Base
  validates :firstname, :lastname, :uin, :presence => true
  validates :uin, :uniqueness => true

  has_many :office_hours
end
