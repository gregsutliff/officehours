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

  describe ".open(day,time)" do
    let(:hour){FactoryGirl.create(:office_hour, :day => 1, :start => '09:00', :stop => '11:00')}
    it "returns office hours that are open at the specified day and time" do
      hours = OfficeHour.open(1, '10:00')
      expect(hours).to include hour
    end

    it "does not return office hours that are not open" do
      hours = OfficeHour.open(1, '12:00')
      expect(hours).not_to include hour
    end

    it "returns an empty array if no office hours are open" do
      hours = OfficeHour.open(1, '01:00') 
      expect(hours).to be_empty
    end
  end

  describe ".in_building(building_id)" do
	 let(:building){FactoryGirl.create(:building)}
	 let(:office){FactoryGirl.create(:office, :building_id => 1)}
	 let(:member){FactoryGirl.create(:member, office: office)}
	 let(:hour){FactoryGirl.create(:office_hour, member: member)}
    it "returns office hours that exist for the specified building" do
      hours = OfficeHour.in_building(1)
      expect(hours).to include hour
    end

    it "does not return office hours that exist for other buildings" do
      hours = OfficeHour.in_building(2)
      expect(hours).not_to include hour
    end
  end
end

