require 'rails_helper'

RSpec.describe Building, type: :model do
  it 'has a valid factory' do
    expect(build_stubbed(:building)).to be_valid
  end

  it 'must have a fullname' do
    expect(build_stubbed(:building, fullname: '')).to_not be_valid
  end

  it 'must have an abbreviation' do
    expect(build_stubbed(:building, abbrev: '')).to_not be_valid
  end
end
