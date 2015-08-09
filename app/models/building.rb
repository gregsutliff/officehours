class Building < ActiveRecord::Base
  validates :fullname, :abbrev, :presence => true
  has_many :members
  has_many :office_hours
  has_many :offices


end
