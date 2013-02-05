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

ActiveRecord::Schema.define(:version => 20130205103836) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "invites", :force => true do |t|
    t.integer  "vk_user_id",   :null => false
    t.integer  "vk_friend_id", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "invites", ["vk_user_id", "vk_friend_id"], :name => "index_invites_on_vk_user_id_and_vk_friend_id", :unique => true

  create_table "projects", :force => true do |t|
    t.integer  "category_id", :null => false
    t.string   "name",        :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "url",         :null => false
  end

  add_index "projects", ["category_id"], :name => "index_projects_on_category_id"

end
