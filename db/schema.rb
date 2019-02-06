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

ActiveRecord::Schema.define(version: 2019_02_06_131525) do

  create_table "links", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "original", null: false
    t.string "short", null: false
    t.integer "click_count", default: 0
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["active"], name: "index_links_on_active"
    t.index ["click_count"], name: "index_links_on_click_count"
    t.index ["original"], name: "index_links_on_original"
    t.index ["short", "active", "original"], name: "index_links_on_short_and_active_and_original"
    t.index ["short", "active"], name: "index_links_on_short_and_active"
    t.index ["short"], name: "index_links_on_short", unique: true
  end

end
