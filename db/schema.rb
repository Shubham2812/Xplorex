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

ActiveRecord::Schema.define(version: 20170312203607) do

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "gender"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
  end

  create_table "foods", force: :cascade do |t|
    t.integer  "ownerID"
    t.string   "name"
    t.string   "tag"
    t.string   "location"
    t.string   "photo"
    t.string   "description"
    t.string   "menu"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "offers", force: :cascade do |t|
    t.integer  "outletID"
    t.string   "category"
    t.string   "content"
    t.date     "from"
    t.date     "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "owners", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.string   "gender"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "customerID"
    t.string   "category"
    t.string   "outletID"
    t.string   "content"
    t.integer  "rating"
    t.boolean  "visited"
    t.boolean  "recommend"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
