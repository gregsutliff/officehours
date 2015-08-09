class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :fullname
      t.string :abbrev

      t.timestamps null: false
    end
  end
end
