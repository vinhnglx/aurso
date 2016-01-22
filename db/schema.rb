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

ActiveRecord::Schema.define(version: 20160122173601) do

  create_table "api_tokens", force: :cascade do |t|
    t.string   "access_token"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "car_types", force: :cascade do |t|
    t.string   "name"
    t.string   "car_type_slug"
    t.string   "car_type_code"
    t.integer  "base_price"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "car_id"
  end

  add_index "car_types", ["car_id"], name: "index_car_types_on_car_id", unique: true

  create_table "cars", force: :cascade do |t|
    t.string   "name"
    t.string   "car_slug"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "organization_id"
  end

  add_index "cars", ["organization_id"], name: "index_cars_on_organization_id", unique: true

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.string   "public_name"
    t.string   "type"
    t.string   "pricing_policy"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

end
