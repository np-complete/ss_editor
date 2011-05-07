class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null => false
      t.text   :profile
      t.string :openid_url, :null => false
      t.timestamps
    end
    add_index :users, :openid_url, :unique => true
  end

  def self.down
    drop_table :users
  end
end
