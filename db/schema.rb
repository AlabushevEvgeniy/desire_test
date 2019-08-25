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

ActiveRecord::Schema.define(version: 2019_08_25_185316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.string "title"
    t.string "favorite_post_type"
    t.bigint "favorite_post_id"
    t.index ["favorite_post_type", "favorite_post_id"], name: "index_favorites_on_favorite_post_type_and_favorite_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "preview"
    t.text "text"
    t.boolean "published"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "read_posts", force: :cascade do |t|
    t.string "title"
    t.string "read_item_type"
    t.bigint "read_item_id"
    t.index ["read_item_type", "read_item_id"], name: "index_read_posts_on_read_item_type_and_read_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "posts", "users"
end
