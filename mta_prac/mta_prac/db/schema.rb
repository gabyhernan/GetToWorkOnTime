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

ActiveRecord::Schema.define(version: 20160927000503) do

  create_table "users", force: :cascade do |t|
    t.string   "email",                      null: false
    t.string   "full_name"
    t.integer  "phone_number",    limit: 10
    t.string   "train_lines"
    t.integer  "commute_time"
    t.integer  "zipcode",         limit: 5
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "password_digest"
    t.string   "monday"
    t.string   "tuesday"
    t.string   "wednesday"
    t.string   "thursday"
    t.string   "friday"
    t.string   "saturday"
    t.string   "sunday"
  end

end
