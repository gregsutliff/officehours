class CreateUicEmails < ActiveRecord::Migration
  def change
    create_table :uic_emails do |t|
      t.string :address
      t.references :member, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
