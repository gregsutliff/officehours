require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke

    departments = [ %w(Philosophy phil), %w(Biology bio), %w(Mathematics math), %w(Political\ Science poli-sci)]

    departments.each do |n|
      Department.create(name: n[0], abbrev: n[1])
    end

    Building.create(fullname: 'University Hall', abbrev: 'UH')
    Building.create(fullname: 'Behavioral Sciences Building')
    Building.create(fullname: 'Burnham Hall', abbrev: 'Burnham')
    Building.create(fullname: 'Daley Library', abbrev: 'Daley Library')
    Building.create(fullname: 'Douglas Hall', abbrev: 'Douglas')
    Building.create(fullname: 'Grant Hall', abbrev: 'Grant')
    Building.create(fullname: 'Henry Hall', abbrev: 'Henry')
    Building.create(fullname: 'Hull House', abbrev: 'Hull House')
    Building.create(fullname: 'Jefferson Hall', abbrev: 'Jefferson')
    Building.create(fullname: 'Lincoln Hall', abbrev: 'Lincoln')
    Building.create(fullname: 'UIC Pavilion', abbrev: 'Pavilion')
    Building.create(fullname: 'Rice Building', abbrev: 'Rice')
    Building.create(fullname: 'Student Center East', abbrev: 'SCE')
    Building.create(fullname: 'Science & Engineering Labs', abbrev: 'SEL')
    Building.create(fullname: 'Science & Engineering Offices', abbrev: 'SEO')
    Building.create(fullname: 'Student Services Building', abbrev: 'SSB')
    Building.create(fullname: 'Stevenson Hall', abbrev: 'Stevenson')

    1000.times do
      member = Member.new
      member.firstname = Faker::Name.first_name
      member.lastname = Faker::Name.last_name
      member.door_number = Faker::Number.between(1, 100)
      member.department = Department.find(Faker::Number.between(1, 4))
      member.building = Building.find(Faker::Number.between(1, 16))
      member.email = Faker::Internet.email
      member.save
    end

    User.create(email: 'organizer@gmail.com', password: 'password', role: 3, confirmed_at: Time.now)

    User.create(email: 'admin@gmail.com', password: 'password', role: 1, confirmed_at: Time.now)

    members = Member.all

    members.each do |m|
      2.times do
        times = random_hour(01,22)
        m.office_hours << OfficeHour.create(day: Faker::Number.between(0,6), start: times[0], stop: times[1])
        m.save
      end
    end
  end
end

def random_hour(from, to)
  start = (Date.today + rand(from..to).hour + rand(0..60.minutes)).to_datetime
  stop = (start + 2.hour).to_datetime
  [start, stop]
end
