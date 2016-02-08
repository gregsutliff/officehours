require 'rails_helper'

RSpec.describe Department, type: :model do
  it 'has a valid factory' do
    expect(build(:department)).to be_valid
  end

  it 'must have a name' do
    expect(build(:department, name: '')).to_not be_valid
  end

  it 'must have an abbreviation' do
    expect(build(:department, abbrev: '')).to_not be_valid
  end

end
