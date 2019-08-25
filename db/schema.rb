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

ActiveRecord::Schema.define(version: 2019_08_25_123405) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorite_news_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "news_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_item_id"], name: "index_favorite_news_items_on_news_item_id"
    t.index ["user_id"], name: "index_favorite_news_items_on_user_id"
  end

  create_table "news_items", force: :cascade do |t|
    t.string "title"
    t.string "preview"
    t.text "text"
    t.boolean "published"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_news_items_on_user_id"
  end

  create_table "read_news_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "news_item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_item_id"], name: "index_read_news_items_on_news_item_id"
    t.index ["user_id"], name: "index_read_news_items_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "signature"
    t.string "password_hash"
    t.string "password_salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "favorite_news_items", "news_items"
  add_foreign_key "favorite_news_items", "users"
  add_foreign_key "news_items", "users"
  add_foreign_key "read_news_items", "news_items"
  add_foreign_key "read_news_items", "users"
end
