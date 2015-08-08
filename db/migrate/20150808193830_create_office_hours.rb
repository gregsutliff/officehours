class CreateOfficeHours < ActiveRecord::Migration
  def change
    create_table :office_hours do |t|
      t.integer :day
      t.time :start
      t.time :stop
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
