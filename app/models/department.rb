class Department < ActiveRecord::Base
	has_many :members
	has_many :users
	validates :name, :presence => true
	validates :abbrev, :presence => true
end
