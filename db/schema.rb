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

ActiveRecord::Schema.define(:version => 20130311103225) do

  create_table "categories", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["name"], :name => "index_categories_on_name", :unique => true

  create_table "projects", :force => true do |t|
    t.integer  "category_id",                        :null => false
    t.string   "name",                               :null => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "url",                                :null => false
    t.integer  "rating",          :default => 0,     :null => false
    t.boolean  "is_reviewed",     :default => false, :null => false
    t.string   "github_path"
    t.text     "description"
    t.boolean  "has_cocoapod",    :default => false, :null => false
    t.string   "source_code_url"
  end

  add_index "projects", ["category_id"], :name => "index_projects_on_category_id"

  create_table "projects_tags", :force => true do |t|
    t.integer  "project_id", :null => false
    t.integer  "tag_id",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "projects_tags", ["project_id", "tag_id"], :name => "index_projects_tags_on_project_id_and_tag_id", :unique => true

  create_table "tags", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

end
