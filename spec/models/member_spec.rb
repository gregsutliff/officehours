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

end
