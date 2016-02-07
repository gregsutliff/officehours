class PruneDatabase < ActiveRecord::Migration
  def change
    change_table :members do |m|
      m.remove :uin
      m.remove :office_id
    end

    change_table :buildings do |b|
      b.remove :image_path
    end
  end
end
