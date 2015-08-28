require 'rails_helper'

RSpec.describe Office, type: :model do
  it "has a valid factory" do
    expect(build(:office)).to be_valid
  end

  it "requires an associated building" do
    expect(build(:office, :building_id => "")).not_to be_valid
  end

  it "requires a doornumber" do
    expect(build(:office, :door_number => "")).not_to be_valid
  end
end
