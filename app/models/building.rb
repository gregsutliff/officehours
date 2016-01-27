class Building < ActiveRecord::Base
  searchkick text_middle: [:fullname, :abbrev], autocomplete: %w(fullname abbrev)
  validates :fullname, :abbrev, presence: true
  has_many :members
  has_many :office_hours, through: :members
  has_attached_file :avatar, styles: { thumb: '70x70>'}, default_url: '/images/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\.*\Z/
end
