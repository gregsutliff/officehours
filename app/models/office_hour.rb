class OfficeHour < ActiveRecord::Base
  validates :day, :start, :stop, :member_id,  presence: true

  belongs_to :member
  belongs_to :building
  belongs_to :office

  scope :open, -> (day, time) { where(:day => day).where("? BETWEEN TIME(start) AND TIME(stop)", time)}
  scope :in_building, -> (building_id) { where(:building_id => building_id)}


end
