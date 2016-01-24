class MoveEmailToMembers < ActiveRecord::Migration
  def change
  	drop_table :emails

  	change_table :members do |t|
  		t.string :email
  	end
  end
end
