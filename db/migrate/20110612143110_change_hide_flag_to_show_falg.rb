class ChangeHideFlagToShowFalg < ActiveRecord::Migration
  def self.up
    rename_column :stories, :hidden, :published
  end

  def self.down
    rename_column :stories, :published, :hidden
  end
end
