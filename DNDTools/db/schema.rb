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

ActiveRecord::Schema.define(version: 20150417040219) do

  create_table "art_items", force: true do |t|
    t.string   "name"
    t.integer  "low"
    t.integer  "high"
    t.string   "avg_val"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gem_items", force: true do |t|
    t.string   "name"
    t.integer  "low"
    t.integer  "high"
    t.string   "avg_val"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "loot_rolls", force: true do |t|
    t.integer  "level"
    t.string   "loot_type"
    t.integer  "low_roll"
    t.integer  "high_roll"
    t.string   "die"
    t.integer  "scale"
    t.string   "coin_type"
    t.string   "sub_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "major_items", force: true do |t|
    t.string   "name"
    t.integer  "low"
    t.integer  "high"
    t.string   "avg_val"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medium_items", force: true do |t|
    t.string   "name"
    t.integer  "low"
    t.integer  "high"
    t.string   "avg_val"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "minor_items", force: true do |t|
    t.string   "name"
    t.integer  "low"
    t.integer  "high"
    t.string   "avg_val"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mundane_items", force: true do |t|
    t.string   "name"
    t.integer  "low"
    t.integer  "high"
    t.integer  "sub_low"
    t.integer  "sub_high"
    t.string   "avg_val"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
