class AddNonUicEmailToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :non_uic_email, :string
  end
end
