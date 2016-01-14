class Building < ActiveRecord::Base
  validates :fullname, :abbrev, :presence => true
  has_many :members, :through => :offices
  has_many :office_hours, :through => :members
  has_many :offices, :dependent => :destroy
end
