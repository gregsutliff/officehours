class OfficeHour < ActiveRecord::Base
  validates :day, :start, :stop, :member_id,  presence: true

  belongs_to :member

  scope :open, -> (day, time) { where(:day => day).where("? BETWEEN strftime('%H:%M', start) AND strftime('%H:%M', stop)", time)}


end
