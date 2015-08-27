FactoryGirl.define do
  factory :member do
    firstname "Greg"
    lastname "Sutliff"
    uin Faker::Number.number(9)
		office
		department

		factory :member_with_office_hour do
			after(:create) do |member|
				FactoryGirl.create(:office_hour, member: member, :start => '08:00', :stop => '12:00', :day => 4) 
			end
		end
  end

end
