require 'rails_helper'

RSpec.describe OfficeHour, type: :model do

  it "is invalid without a day" do
    hour = FactoryGirl.build(:office_hour, :day => "")
    expect(hour).not_to be_valid
  end

  it "is invalid without a start time" do
    hour = FactoryGirl.build(:office_hour, :start => "")
    expect(hour).not_to be_valid
  end

  it "is invalid without a stop time" do
    hour = FactoryGirl.build(:office_hour, :stop => "")
    expect(hour).not_to be_valid
  end

  it "is invalid without an associated member" do
    hour = FactoryGirl.build(:office_hour, :member_id => "")
    expect(hour).not_to be_valid
  end
end

