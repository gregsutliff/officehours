# Each building on campus is represented as a building object. Buildings must
# have fullnames, and abbrevs. They have_many members, and have_many
# office_hours through those members. They can also have avatars, which will
# be displayed next to each office hour on the main page so that students can
# more easily locate the buildings.
class Building < ActiveRecord::Base
  searchkick callbacks: :async, text_middle: [:fullname, :abbrev], autocomplete: %w(fullname abbrev)

  validates :fullname, :abbrev, presence: true
  has_many :members
  has_many :office_hours, through: :members
  # has_attached_file is a helper provided by paperclip. Each building can have
  # an avatar image.
  has_attached_file :avatar, styles: { thumb: '70x70>'}, default_url: ActionController::Base.helpers.asset_path('missing.png')
  validates_attachment :avatar, content_type: { content_type: ['image/jpeg']}
end
