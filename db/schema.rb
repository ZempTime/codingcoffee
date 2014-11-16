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

ActiveRecord::Schema.define(version: 20141116205035) do

  create_table "reviews", force: true do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.integer  "wifi_quality"
    t.integer  "coffee_quality"
    t.integer  "coffee_price"
    t.integer  "chair_drag_loudness"
    t.integer  "outlets_available"
    t.integer  "temperature"
    t.string   "awesome_people"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "venues", force: true do |t|
    t.string   "name"
    t.float    "lat",           limit: 24
    t.float    "lng",           limit: 24
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "hours_display"
    t.string   "neighborhood"
    t.string   "factual_id"
    t.string   "phone"
    t.string   "country"
    t.string   "website"
  end

end
