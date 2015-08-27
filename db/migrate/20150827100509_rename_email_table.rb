class RenameEmailTable < ActiveRecord::Migration
  def self.up
		rename_table :uic_emails, :emails
  end

	def self.down
		rename_table :emails, :uic_emails
	end
end
