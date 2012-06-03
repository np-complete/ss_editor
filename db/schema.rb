# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110612143110) do

  create_table "characters", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "characters", ["name"], :name => "index_characters_on_name", :unique => true

  create_table "dialogs", :force => true do |t|
    t.integer  "story_id",     :null => false
    t.integer  "character_id", :null => false
    t.integer  "face_id",      :null => false
    t.integer  "line_num",     :null => false
    t.string   "message",      :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "dialogs", ["story_id", "line_num"], :name => "index_dialogs_on_story_id_and_line_num", :unique => true

  create_table "faces", :force => true do |t|
    t.string   "name",              :null => false
    t.integer  "character_id",      :null => false
    t.integer  "user_id",           :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  add_index "faces", ["character_id", "user_id"], :name => "index_faces_on_character_id_and_user_id"
  add_index "faces", ["user_id"], :name => "index_faces_on_user_id"

  create_table "stories", :force => true do |t|
    t.string   "title",                         :null => false
    t.integer  "user_id",                       :null => false
    t.boolean  "published",  :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "stories", ["published"], :name => "index_stories_on_hidden"
  add_index "stories", ["user_id", "published"], :name => "index_stories_on_user_id_and_hidden"

  create_table "users", :force => true do |t|
    t.string   "name",       :null => false
    t.text     "profile"
    t.string   "openid_url", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["openid_url"], :name => "index_users_on_openid_url", :unique => true

end
