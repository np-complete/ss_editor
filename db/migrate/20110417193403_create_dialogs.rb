class CreateDialogs < ActiveRecord::Migration
  def self.up
    create_table :dialogs do |t|
      t.integer :story_id, :null => false
      t.integer :character_id, :null => false
      t.integer :face_id, :null => false
      t.integer :line_num, :null => false
      t.string  :message, :null => false
      t.timestamps
    end
    add_index :dialogs, [:story_id, :line_num], :unique => true
  end

  def self.down
    drop_table :dialogs
  end
end
