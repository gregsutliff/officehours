class AddDepartmentToMember < ActiveRecord::Migration
  def change
    add_reference :members, :department, index: true, foreign_key: true
  end
end
