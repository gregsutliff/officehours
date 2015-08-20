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
			member.save
		end
		10.times do
			building = Building.new
			building.fullname = Faker::Address.street_name
			building.abbrev = Faker::Hacker.abbreviation
			building.save
		end
		100.times do
			office = Office.new
			office.door_number = Faker::Number.between(1,200)
			office.building_id = Faker::Number.between(1,10)
			office.save
		end

		100.times do
			hour = OfficeHour.new
			hour.day = Faker::Number.between(1,7)
			hour.start = Faker::Time.between(2.days.ago, Time.now, :morning)
			hour.stop = Faker::Time.between(2.days.ago, Time.now, :night)
			hour.member_id = Faker::Number.between(1,50)
			hour.save
		end
	end
end