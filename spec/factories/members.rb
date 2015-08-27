FactoryGirl.define do
  factory :member do
    firstname "Greg"
    lastname "Sutliff"
    uin Faker::Number.number(9)
		office
		department
  end

end
