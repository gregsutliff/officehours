FactoryGirl.define do
  factory :office_hour do
    start Time.now
    stop Time.now + 100
    day 1
    member
  end
end
