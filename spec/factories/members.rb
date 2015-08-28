FactoryGirl.define do
  factory :member do
    firstname "Greg"
    lastname "Sutliff"
    uin Faker::Number.number(9)

		factory :member_with_office do
			after(:create) do |member|
				member.office = FactoryGirl.create(:office)
				member.save
			end
		end

		factory :member_with_office_hour do
			after(:create) do |member|
				create(:office_hour, member: member, :start => (Time.now - 1000).strftime('%H:%M'), :stop => Time.now.strftime('%H:%M'), :day => Time.now.strftime('%w')) 
				member.office = create(:office)
				member.department = create(:department)
				member.save
			end
		end
  end
end
