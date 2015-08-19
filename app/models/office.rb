class Office < ActiveRecord::Base
  validates :building_id, :door_number, :presence => true
  belongs_to :building
  has_many :members
  has_many :office_hours, :through => :members, :dependent => :destroy
end
