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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140618123204) do

  create_table "beverage_tabs", force: true do |t|
    t.integer  "tab_id"
    t.integer  "count",                              default: 0
    t.decimal  "price",      precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.decimal  "capacity",   precision: 8, scale: 2
  end

  create_table "beverages", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.boolean  "available"
    t.decimal  "price",              precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "capacity",           precision: 8, scale: 2
    t.decimal  "external_price",     precision: 8, scale: 2
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "minutes_approvements", force: true do |t|
    t.integer  "minute_id"
    t.integer  "approved_minute_id"
    t.integer  "pro"
    t.integer  "con"
    t.integer  "abs"
    t.boolean  "apparent_majority"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "minutes_approvements", ["approved_minute_id"], name: "index_minutes_approvements_on_approved_minute_id"
  add_index "minutes_approvements", ["minute_id"], name: "index_minutes_approvements_on_minute_id"

  create_table "minutes_attendances", force: true do |t|
    t.integer "user_id"
    t.integer "minute_id"
    t.string  "type"
  end

  add_index "minutes_attendances", ["minute_id"], name: "index_minutes_attendances_on_minute_id"
  add_index "minutes_attendances", ["user_id"], name: "index_minutes_attendances_on_user_id"

  create_table "minutes_items", force: true do |t|
    t.date     "date"
    t.string   "title"
    t.text     "content"
    t.integer  "order"
    t.integer  "minute_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "minutes_items", ["minute_id"], name: "index_minutes_items_on_minute_id"

  create_table "minutes_minutes", force: true do |t|
    t.date     "date"
    t.integer  "keeper_of_the_minutes_id"
    t.integer  "chairperson_id"
    t.date     "released_date"
    t.boolean  "has_quorum"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "guests"
    t.date     "draft_sent_date"
    t.string   "type"
    t.date     "approved_date"
  end

  add_index "minutes_minutes", ["chairperson_id"], name: "index_minutes_minutes_on_chairperson_id"
  add_index "minutes_minutes", ["keeper_of_the_minutes_id"], name: "index_minutes_minutes_on_keeper_of_the_minutes_id"

  create_table "minutes_motions", force: true do |t|
    t.integer  "order"
    t.integer  "mover_id"
    t.integer  "pro"
    t.integer  "con"
    t.integer  "abs"
    t.text     "rationale"
    t.integer  "amount"
    t.integer  "item_id"
    t.boolean  "approved"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "apparent_majority"
  end

  add_index "minutes_motions", ["item_id"], name: "index_minutes_motions_on_item_id"
  add_index "minutes_motions", ["mover_id"], name: "index_minutes_motions_on_mover_id"

  create_table "people", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "email"
    t.string   "phone"
    t.date     "birthday"
    t.text     "misc"
    t.string   "loginname"
    t.string   "remember_token"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "on_beverage_list", default: false
    t.string   "cached_tag_list"
  end

  create_table "tabs", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",     default: "running"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "user_tabs", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "tab_id"
  end

  add_index "user_tabs", ["user_id", "tab_id"], name: "index_user_tabs_on_user_id_and_tab_id", unique: true

  create_table "users", force: true do |t|
    t.string   "loginname"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "street"
    t.string   "zip"
    t.string   "city"
    t.string   "email"
    t.string   "phone"
    t.date     "birthday"
    t.text     "misc"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
