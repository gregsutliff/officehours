class Department < ActiveRecord::Base
  searchkick callsbacks: :async, text_middle: [:name], autocomplete: ['name']

  has_many :members
  validates :name, :abbrev, presence: true
end
