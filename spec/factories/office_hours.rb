FactoryGirl.define do
  factory :office_hour do
    day 1
    start Time.now.strftime('%H:%M')
    stop '12:00'
		member
  end

end
