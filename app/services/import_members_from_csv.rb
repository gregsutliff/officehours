require 'csv'

class ImportMembersFromCsv

  def initialize(file)
    @file = file
  end

  def import
    CSV.foreach(@file.path, headers: true) do |row|
      memberhash = row.to_hash
      firstname = memberhash['firstname']
      lastname = memberhash['lastname']
      email = memberhash['email']
      door = memberhash[:door]
      department = Department.find_by(name: memberhash['department']) ||
                   Department.create(name: memberhash['department'],
                                     abbrev: memberhash['department'][0..3])
      department = department.id
      clean_hash = { firstname: firstname,
                     lastname: lastname,
                     email: email,
                     department_id: department,
                     door_number: door }
      member = Member.find_by(email: email) || Member.new
      member.update(clean_hash)
      member.save
    end
  end
end
