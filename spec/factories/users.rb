FactoryGirl.define do
  factory :user do
    role 3
    email { Faker::Internet.email }
    password "password1948"
    password_confirmation "password1948"
    confirmed_at Date.today
		department
  end
end
