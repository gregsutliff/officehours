class AddOfficeToMember < ActiveRecord::Migration
  def change
    add_reference :members, :office, index: true, foreign_key: true
  end
end
