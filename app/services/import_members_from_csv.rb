require 'csv'
# ImportMembersFromCsv is a service which takes a csv containing member data
# and uses that data to create and/or update the member database.
class ImportMembersFromCsv
  def initialize(file)
    @file = file
  end

  def import
    CSV.foreach(@file.path, headers: true) do |row|
      memberhash = clean_hash(row.to_hash)
      member = Member.find_by(email: memberhash['email']) || Member.new
      member.update(memberhash)
      member.save
    end
  end

  private

  # clean_hash takes a hash that may contain keys for many more fields than we
  # are interested in putting into our database, and it prunes it so as to
  # return a hash containing only the stuff that we will be using.
  def clean_hash(hash)
    # checks to see if the department already exists and creates a new one if
    # necessary
    department = Department.find_by(name: hash['department']).id ||
                 Department.create(name: hash['department'],
                                   abbrev: hash['department'][0..3]).id
    result = { firstname: hash['firstname'],
               lastname: hash['lastname'],
               email: hash['email'],
               door_number: hash['door'],
               department_id: department }
    result
  end
end
