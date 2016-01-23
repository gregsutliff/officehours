class AddBuildingToMembers < ActiveRecord::Migration
  def change
    add_reference :members, :building, index: true, foreign_key: true
  end
end
