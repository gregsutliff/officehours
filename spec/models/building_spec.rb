require 'rails_helper'

RSpec.describe Building, type: :model do
  it "has a valid factory" do
    expect(build(:building)).to be_valid
  end

  it "requires a name" do
    expect(build(:building, :fullname => "")).not_to be_valid
  end

  it "requires an abbreviation" do
    expect(build(:building, :abbrev => "")).not_to be_valid
  end
end
