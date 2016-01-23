class AddDoorNumberToMember < ActiveRecord::Migration
  def change
    add_column :members, :door_number, :string
  end
end
