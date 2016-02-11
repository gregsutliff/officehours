# Each office hour has a day(integer), a start(time), a stop(time),
# and belongs to one Member. This allows for us to use any day/time
# combination to query the database for office hours that are currently open.
# This assumes that office hours remain the same from week to week.
class OfficeHour < ActiveRecord::Base
  searchkick text_middle: [:building_fullname, :building_abbrev]

  def search_data
    attributes.merge(
      building_fullname: building_fullname,
      building_abbrev: building.abbrev,
      member_fullname: member_fullname,
      department_name: department_name
    )
  end

  validates :day, :start, :stop, :member_id, presence: true
  belongs_to :member
  has_one :building, through: :member
  has_one :department, through: :member

  delegate :fullname, to: :member, prefix: true
  delegate :fullname, to: :building, prefix: true
  delegate :name, to: :department, prefix: true

  scope :open, -> (day, time) {
                                where(day: day)
                                .where('? BETWEEN TIME(start) AND TIME(stop)',
                                       time)
                              }
  scope :in_building, -> (building_id) { where(building_id: building_id) }

  # time_left takes a timestamp as an argument and returns the number of
  # minutes remaining until the stop time of the office hour.
  def time_left(present_time)
    ((stop.strftime('%H:%M').to_time - present_time.to_time) / 60).to_i
  end
end
