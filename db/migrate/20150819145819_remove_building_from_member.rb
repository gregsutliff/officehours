class RemoveBuildingFromMember < ActiveRecord::Migration
  def change
		remove_column :members, :building_id
		remove_column :office_hours, :building_id
  end
end
