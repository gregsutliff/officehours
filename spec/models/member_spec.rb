require 'rails_helper'

RSpec.describe Member, :type => :model do
  it "has a valid factory" do
    expect(create(:member)).to be_valid
  end

  it "is invalid without a firstname" do
    member = build(:member, :firstname => "")
    expect(member).not_to be_valid
  end
  
  it "is invalid without a lastname" do
    member = build(:member, :lastname => "")
    expect(member).not_to be_valid
  end

  it "is invalid without a UIN" do
    member = build(:member, :uin => "")
    expect(member).not_to be_valid
  end

  it "must have a unique UIN" do
    create(:member, :uin => 1234567)
    member = build(:member, :uin => 1234567)
    expect(member).not_to be_valid
  end

	describe "#fullname" do
		let(:member){create(:member, :firstname => "Greg", :lastname => "Sutliff")}
		it "returns a member's full name" do
			expect(member.fullname).to eq "Greg Sutliff"
		end
	end
end
