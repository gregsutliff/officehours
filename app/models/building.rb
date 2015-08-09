class Building < ActiveRecord::Base
  has_many :members
  has_many :office_hours
end
