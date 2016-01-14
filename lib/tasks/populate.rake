require 'faker'

namespace :db do 
	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task["db:reset"].invoke
		50.times do
			member = Member.new
			member.firstname = Faker::Name.first_name
			member.lastname = Faker::Name.last_name
			member.uin = Faker::Number.number(9)
			member.office_id = Faker::Number.between(1,100)
			member.department_id = Faker::Number.between(1,3)
			member.save
		end
		10.times do
			building = Building.new
			building.fullname = Faker::Address.street_name
			building.abbrev = Faker::Hacker.abbreviation
			building.save
		end

		User.create(:email => "organizer@gmail.com", :password => "password", :role => 3, :confirmed_at => Time.now)

		100.times do
			office = Office.new
			office.door_number = Faker::Number.between(1,200)
			office.building_id = Faker::Number.between(1,10)
			office.save
		end

		500.times do
			hour = OfficeHour.new
			hour.day = Faker::Number.between(0,7)
			hour.stop = '17:00'
			hour.start = '05:00'
			hour.member_id = Faker::Number.between(1,50)
			hour.save
		end

		['Philosophy', 'Biology', 'Math'].each do |n|
			dept = Department.create(:name => n)
		end
	end
end
