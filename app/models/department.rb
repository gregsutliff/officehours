class Department < ActiveRecord::Base
	searchkick text_middle: [:name], autocomplete: ['name']

	has_many :members
	has_many :users
	validates :name, :presence => true
	validates :abbrev, :presence => true
end
