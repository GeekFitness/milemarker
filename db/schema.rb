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

ActiveRecord::Schema.define(version: 20160412123300) do

  create_table "likes", force: :cascade do |t|
    t.boolean  "like"
    t.integer  "runner_id"
    t.integer  "shoe_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "runners", force: :cascade do |t|
    t.string   "runnername"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
  end

  create_table "runs", force: :cascade do |t|
    t.decimal  "run_distance"
    t.integer  "run_id"
    t.integer  "shoe_id"
    t.integer  "runner_id"
    t.datetime "run_date"
  end

  create_table "shoes", force: :cascade do |t|
    t.string   "name"
    t.text     "summary"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "runner_id"
    t.string   "picture"
  end

end
