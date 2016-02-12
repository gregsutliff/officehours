# Each faculty member is an instance of the Member class. Members must have a
# firstname and lastname. They can also have an email, have_many office_hours,
# and belong_to one building and one department.
class Member < ActiveRecord::Base
  searchkick callbacks: :async
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :firstname, :lastname, presence: true, length: { maximum: 25 }
  validates :email,
            format: { with: VALID_EMAIL_REGEX },
            allow_nil: true,
            uniqueness: { case_sensitive: false }
  belongs_to :department
  belongs_to :building
  has_many :office_hours, dependent: :destroy

  delegate :name, to: :department, prefix: true
  delegate :fullname, to: :building, prefix: true, allow_nil: true

  def search_data
    attributes.merge(
      department_name: department_name,
      building_fullname: building_fullname
    )
  end

  # Member.searching is used to sort tables of members by selected columns and
  # allow the user to change the sort direction (ascending or descending). it
  # also takes a page argument in order to preserve the current page when
  # resorting tables containing multiple pages of entries.
  def self.searching(query, sort_column, sort_direction, page)
    # if a non-empty query string is provided, then preserve that query
    if query
      search query, order: { sort_column => sort_direction },
                    page: page, per_page: 25
    # if an empty query is provided, return all records
    else
      search '*'
    end
  end

  # Returns the member's fullname
  def fullname
    firstname + ' ' + lastname
  end

  # hours_on_day takes an integer encoding of a weekday and returns all of the
  # office hours that occur on that day. Sunday is 0.
  def hours_on_day(day)
    office_hours.where(day: day)
  end
end
