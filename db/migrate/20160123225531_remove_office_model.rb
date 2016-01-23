class RemoveOfficeModel < ActiveRecord::Migration
  def change
  	drop_table :offices
  	change_table :members do |t|
  		t.remove :office
  	end
  end
end
