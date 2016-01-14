class AddImagePathToBuilding < ActiveRecord::Migration
  def change
    add_column :buildings, :image_path, :string
  end
end
