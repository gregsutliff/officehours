class Member < ActiveRecord::Base
  require 'csv'
  searchkick callbacks: :async

  def search_data
    attributes.merge(
      department_name: department_name,
      building_fullname: building_fullname
      )

  end



  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      memberhash = row.to_hash
      firstname = memberhash['firstname']
      lastname = memberhash['lastname']
      email = memberhash['email']
      department = Department.find_by(name: memberhash['department']) || Department.create(name: memberhash['department'], abbrev: memberhash['department'][0..3])
      department = department.id
      door = memberhash[:door]
      clean_hash = { firstname: firstname, lastname: lastname, email: email, department_id: department, door_number: door }
      member = Member.find_by(email: email) || Member.new
      member.update(clean_hash)
      member.save

    end
  end

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :firstname, :lastname, presence: true
  validates :email, format: { with: VALID_EMAIL_REGEX }, allow_nil: true, uniqueness: { case_sensitive: false }
  belongs_to :department
  belongs_to :building
  has_many :office_hours, dependent: :destroy

  delegate :name, to: :department, prefix: true
  delegate :fullname, to: :building, prefix: true, allow_nil: true

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
