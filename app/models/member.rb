class Member < ActiveRecord::Base
  searchkick

  def search_data
    attributes.merge(
      department_name: department_name,
      building_fullname: building_fullname
      )

  end
  validates :firstname, :lastname, presence: true
  validates :uin, uniqueness: true
  belongs_to :department
  belongs_to :building
  has_one :email
  has_many :office_hours, dependent: :destroy

  delegate :name, to: :department, prefix: true
  delegate :fullname, to: :building, prefix: true
  delegate :uic_email, to: :email, allow_nil: true
  delegate :non_uic_email, to: :email, allow_nil: true

  def self.searching(query, sort_column, sort_direction, page)
    if search
      search query, order: { sort_column => sort_direction }, page: page, per_page: 25
    else
      search '*'
    end
  end

  def fullname
    firstname + ' ' + lastname
  end

  def hours_on_day(day)
    return self.office_hours.where(day: day)
  end

end
