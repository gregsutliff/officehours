class Building < ActiveRecord::Base
	searchkick text_middle: [:fullname, :abbrev], autocomplete: ['fullname', 'abbrev']


  validates :fullname, :abbrev, :presence => true
  has_many :members, :through => :offices
  has_many :office_hours, :through => :members
  has_many :offices, :dependent => :destroy
end
