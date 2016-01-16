class Department < ActiveRecord::Base
	searchkick text_middle: [:name], autocomplete: ['name']

	has_many :members
	has_many :users
	validates :name, :abbrev, presence: true
end
