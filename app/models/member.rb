class Member < ActiveRecord::Base
  validates :firstname, :lastname, :uin, :presence => true
  validates :uin, :uniqueness => true
end
