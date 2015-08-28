require 'rails_helper'

RSpec.describe Department, type: :model do
	it "Has a valid factory" do
		expect(build(:department)).to be_valid
	end

	it "Requires a name" do
		expect(build(:department, :name => "")).not_to be_valid
	end

	it "Requires an abbreviation" do
		expect(build(:department, :abbrev => "")).not_to be_valid
	end
end
