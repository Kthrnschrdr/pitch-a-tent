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

ActiveRecord::Schema.define(version: 20140825145344) do

  create_table "parks", force: true do |t|
    t.string  "name"
    t.string  "address"
    t.decimal "latitude"
    t.decimal "longitude"
    t.text    "pdf_map"
    t.string  "park_url"
  end

  create_table "parks_people", force: true do |t|
    t.integer "park_id"
    t.integer "person_id"
  end

  create_table "people", force: true do |t|
    t.string  "name"
    t.decimal "latitude"
    t.decimal "longitude"
  end

  create_table "stories", force: true do |t|
    t.integer "person_id"
    t.integer "park_id"
    t.text    "story"
  end

end
