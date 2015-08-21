class Department < ActiveRecord::Base
	has_many :members
	validates :name, :presence => true
	validates :abbrev, :presence => true

end
