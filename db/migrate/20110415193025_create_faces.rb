class CreateFaces < ActiveRecord::Migration
  def self.up
    create_table :faces do |t|
      t.string :name, :null => false
      t.integer :character_id, :null => false
      t.integer :user_id, :null => false
      t.timestamps
    end
    add_index :faces, [:character_id, :user_id]
    add_index :faces, :user_id
  end

  def self.down
    drop_table :faces
  end
end
