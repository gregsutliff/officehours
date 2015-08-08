require 'rails_helper'

RSpec.describe Member, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:member)).to be_valid
  end

  it "is invalid without a firstname" do
    member = FactoryGirl.build(:member, :firstname => "")
    expect(member).not_to be_valid
  end
  
  it "is invalid without a lastname" do
    member = FactoryGirl.build(:member, :lastname => "")
    expect(member).not_to be_valid
  end

  it "is invalid without a UIN" do
    member = FactoryGirl.build(:member, :uin => "")
    expect(member).not_to be_valid
  end
end
