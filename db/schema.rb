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

ActiveRecord::Schema.define(:version => 20121108013159) do

  create_table "databases_subjects", :id => false, :force => true do |t|
    t.integer "database_id"
    t.integer "subject_id"
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.string   "alt_titles"
    t.text     "description"
    t.boolean  "restricted"
    t.boolean  "active"
    t.string   "access_url"
    t.boolean  "popular"
    t.text     "notes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "resources_terms", :id => false, :force => true do |t|
    t.integer "resource_id"
    t.integer "term_id"
  end

  create_table "terms", :force => true do |t|
    t.string   "item"
    t.boolean  "iit_subject"
    t.text     "notes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
