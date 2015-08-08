class Member < ActiveRecord::Base
  validates :firstname, :lastname, :uin, :presence => true
end
