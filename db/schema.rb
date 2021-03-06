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

ActiveRecord::Schema.define(version: 20170425144451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "directors", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "directors_movies", force: :cascade do |t|
    t.integer  "movie_id"
    t.integer  "director_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "attendees_nb"
    t.string   "venue"
    t.integer  "activity_id"
    t.string   "activity_type"
    t.datetime "date"
    t.integer  "meetup_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["activity_id", "activity_type"], name: "index_events_on_activity_id_and_activity_type", using: :btree
  add_index "events", ["date"], name: "index_events_on_date", using: :btree

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.integer  "year"
    t.string   "poster_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.boolean  "admin"
  end

end
