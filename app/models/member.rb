class Member < ActiveRecord::Base
  require 'csv'
  searchkick

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
      member = Member.where(email: email)
      department = Department.where(name: memberhash[:department])
      door = memberhash['door']
      building = Building.where(fullname: memberhash[:building])
      if building.count == 1
        building_id = building.first.id
      else
        building_id = 1
      end
      if department.count == 1
        department_id = department.first.id
      else
        department_id = 1
      end
      clean_hash = { firstname: firstname, lastname: lastname, email: email, department_id: department_id, building_id: building_id, door_number: door }
      if member.count == 1
        member.first.update_attributes(clean_hash)
      else
        Member.create!(clean_hash)
      end
    end
  end

  validates :firstname, :lastname, presence: true
  belongs_to :department
  belongs_to :building
  has_many :office_hours, dependent: :destroy

  delegate :name, to: :department, prefix: true
  delegate :fullname, to: :building, prefix: true

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
