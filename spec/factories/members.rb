FactoryGirl.define do
  factory :member do
    firstname "Greg"
    lastname "Sutliff"
    uin Faker::Number.number(9)
		office
		department

		factory :member_with_office_hour do
			after(:create) do |member|
				FactoryGirl.create(:office_hour, member: member, :start => (Time.now - 1000).strftime('%H:%M'), :stop => Time.now.strftime('%H:%M'), :day => Time.now.strftime('%w')) 
			end
		end
  end

end
