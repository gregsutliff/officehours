class AddUicEmailToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :uic_email, :string
  end
end
