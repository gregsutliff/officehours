class AddAttachmentAvatarToBuildings < ActiveRecord::Migration
  def self.up
    change_table :buildings do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :buildings, :avatar
  end
end
