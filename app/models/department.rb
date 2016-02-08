class Department < ActiveRecord::Base
  searchkick callsbacks: :async, text_middle: [:name], autocomplete: ['name']
  validates :name, :abbrev, presence: true
  has_many :members
end
