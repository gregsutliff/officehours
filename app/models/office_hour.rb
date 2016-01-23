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

  scope :open, -> (day, time) { where(day: day).where('? BETWEEN TIME(start) AND TIME(stop)', time) }
  scope :in_building, -> (building_id) { where(building_id: building_id) }

  delegate :fullname, to: :member, prefix: true
  delegate :fullname, to: :building, prefix: true
  delegate :name, to: :department, prefix: true

  def time_left(present_time)
    ((stop.strftime('%H:%M').to_time - present_time.to_time) / 60).to_i
  end
end
