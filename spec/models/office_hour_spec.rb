require 'rails_helper'

RSpec.describe OfficeHour, type: :model do
  it 'has a valid factory' do
    expect(build(:office_hour)).to be_valid
  end
end
