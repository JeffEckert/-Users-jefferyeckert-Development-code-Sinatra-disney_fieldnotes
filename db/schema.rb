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

ActiveRecord::Schema.define(version: 20200507164905) do

  create_table "attractions", force: :cascade do |t|
    t.string  "name"
    t.string  "park"
    t.text    "notes"
    t.string  "photo",   default: "---\n:from: https://static3.srcdn.com/wordpress/wp-content/uploads/2020/03/disney-parks-featured.jpg?q=50&fit=crop&w=960&h=500\n:to: https://thumbs.dreamstime.com/b/walt-disney-world-12175498.jpg\n"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
  end

end
