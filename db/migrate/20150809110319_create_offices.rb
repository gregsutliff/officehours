class CreateOffices < ActiveRecord::Migration
  def change
    create_table :offices do |t|
      t.string :door_number
      t.references :building, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
