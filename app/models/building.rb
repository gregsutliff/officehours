class Building < ActiveRecord::Base
  searchkick text_middle: [:fullname, :abbrev], autocomplete: %w(fullname abbrev)
  validates :fullname, :abbrev, presence: true
  has_many :members
  has_many :office_hours, through: :members
end
