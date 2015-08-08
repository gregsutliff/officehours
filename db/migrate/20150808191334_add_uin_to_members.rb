class AddUinToMembers < ActiveRecord::Migration
  def change
    add_column :members, :uin, :integer
  end
end
