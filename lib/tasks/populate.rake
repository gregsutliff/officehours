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

		Building.create(:fullname => "University Hall", :abbrev => "UH", :image_path => "avatars/uh.jpg")
		Building.create(:fullname => "Behavioral Sciences Building", :abbrev => "BSB", :image_path => "avatars/bsb.jpg")
		Building.create(:fullname => "Burnham Hall", :abbrev => "Burnham", :image_path => "avatars/burnham.jpg")
		Building.create(:fullname => "Daley Library", :abbrev => "Daley Library", :image_path => "avatars/daley.jpg")
		Building.create(:fullname => "Douglas Hall", :abbrev => "Douglas", :image_path => "avatars/douglas.jpg")
		Building.create(:fullname => "Grant Hall", :abbrev => "Grant", :image_path => "avatars/grant.jpg")
		Building.create(:fullname => "Henry Hall", :abbrev => "Henry", :image_path => "avatars/henry.jpg")
		Building.create(:fullname => "Hull House", :abbrev => "Hull House", :image_path => "avatars/hull.jpg")
		Building.create(:fullname => "Jefferson Hall", :abbrev => "Jefferson", :image_path => "avatars/jefferson.jpg")
		Building.create(:fullname => "Lincoln Hall", :abbrev => "Lincoln", :image_path => "avatars/lincoln.jpg")
		Building.create(:fullname => "UIC Pavilion", :abbrev => "Pavilion", :image_path => "avatars/pavilion.jpg")
		Building.create(:fullname => "Rice Building", :abbrev => "Rice", :image_path => "avatars/rice.jpg")
		Building.create(:fullname => "Student Center East", :abbrev => "SCE", :image_path => "avatars/sce.jpg")
		Building.create(:fullname => "Science & Engineering Labs", :abbrev => "SEL", :image_path => "avatars/sel.jpg")
		Building.create(:fullname => "Science & Engineering Offices", :abbrev => "SEO", :image_path => "avatars/seo.jpg")
		Building.create(:fullname => "Student Services Building", :abbrev => "SSB", :image_path => "avatars/ssb.jpg")
		Building.create(:fullname => "Stevenson Hall", :abbrev => "Stevenson", :image_path => "avatars/stevenson.jpg")
		
		User.create(:email => "organizer@gmail.com", :password => "password", :role => 3, :confirmed_at => Time.now)

		100.times do
			office = Office.new
			office.door_number = Faker::Number.between(1,200)
			office.building_id = Faker::Number.between(1,17)
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
