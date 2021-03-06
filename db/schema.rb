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

ActiveRecord::Schema.define(version: 20150205165318) do

  create_table "cabs", force: :cascade do |t|
    t.string   "name",                        null: false
    t.string   "email",                       null: false
    t.string   "password_digest",             null: false
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.integer  "up_votes",        default: 0
    t.integer  "down_votes",      default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "name",            null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.string   "address"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "rides", force: :cascade do |t|
    t.integer  "passengers_id"
    t.integer  "cabs_id"
    t.string   "starts_at",     null: false
    t.string   "ends_at",       null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "rides", ["cabs_id"], name: "index_rides_on_cabs_id"
  add_index "rides", ["passengers_id"], name: "index_rides_on_passengers_id"

end
