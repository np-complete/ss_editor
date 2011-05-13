class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.string :title, :null => false
      t.integer :user_id, :null => false
      t.boolean :hidden, :default => false
      t.timestamps
    end
    add_index :stories, [:user_id, :hidden]
    add_index :stories, :hidden
  end

  def self.down
    drop_table :stories
  end
end
