class PaperclipForFaces < ActiveRecord::Migration
  def self.up
    change_table :faces do |t|
      t.string   :icon_file_name
      t.string   :icon_content_type
      t.integer  :icon_file_size
      t.datetime :icon_updated_at
    end
  end

  def self.down 
    change_table :faces do |t|
      t.remove :icon_file_name
      t.remove :icon_content_type
      t.remove :icon_file_size
      t.remove :icon_updated_at
    end
  end
end
