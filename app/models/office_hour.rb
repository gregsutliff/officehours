class OfficeHour < ActiveRecord::Base
  validates :day, :start, :stop, :member_id,  presence: true
  belongs_to :member
	has_one :office, :through => :member
	has_one :building, :through => :office 

  scope :open, -> (day, time) { where(:day => day).where("? BETWEEN TIME(start) AND TIME(stop)", time)}
  scope :in_building, -> (building_id) { where(:building_id => building_id)}


	delegate :fullname, to: :member, prefix: true
	delegate :fullname, to: :building, prefix: true

end
