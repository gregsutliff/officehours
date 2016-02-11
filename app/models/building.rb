# Each building on campus is represented as a building object. Buildings must
# have fullnames, and abbrevs. They have_many members, and have_many
# office_hours through those members. They can also have avatars, which will
# be displayed next to each office hour on the main page so that students can
# more easily locate the buildings.
class Building < ActiveRecord::Base
  # searchkick is a gem that makes it easier to work with elasticsearch.
  # callbacks: :async updates the index in the background when a record is
  # inserted.
  searchkick callbacks: :async,
            # text_middle will return matches when the query sequence matches
            # any place within the selected fields.
             text_middle: %i(fullname abbrev),
             # autocomplete
             autocomplete: %i(fullname abbrev)

  validates :fullname, :abbrev, presence: true
  has_many :members
  has_many :office_hours, through: :members
  # has_attached_file is a helper provided by paperclip. Each building can have
  # an avatar image.
  has_attached_file :avatar,
                    styles: { thumb: '70x70>' },
                    default_url: ActionController::Base.helpers.asset_path('missing.png')
  validates_attachment :avatar, content_type: { content_type: ['image/jpeg'] }
end
