require 'rails_helper'

RSpec.describe Member, type: :model do
  it 'has a valid factory' do
    expect(build(:member)).to be_valid
  end

  it 'must have a firstname' do
    @member = build(:member, firstname: '')
    expect(@member).to_not be_valid
  end

  it 'must have a lastname' do
    @member = build(:member, lastname: '')
    expect(@member).to_not be_valid
  end

  it 'cannot have a firstname longer than 25 characters.' do
    @member = build_stubbed(:member, firstname: 'a' * 26)
    expect(@member).to_not be_valid
  end

  it 'cannot have a lastname longer than 25 characters.' do
    @member = build_stubbed(:member, lastname: 'a' * 26)
    expect(@member).to_not be_valid
  end

  it 'must have a unique email address' do
    @member = create(:member, email: 'member@gmail.com')
    @member2 = build(:member, email: 'member@gmail.com')
    expect(@member2).to_not be_valid
  end
end
