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

ActiveRecord::Schema.define(version: 2023_06_13_151824) do

  create_table "hikes", force: :cascade do |t|
    t.string "name"
    t.integer "length"
    t.integer "difficulty_level"
    t.integer "estimated_time"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id"], name: "index_hikes_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "statename"
    t.string "townname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
