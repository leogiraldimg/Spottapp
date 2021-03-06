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

ActiveRecord::Schema.define(version: 2019_11_17_102711) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "administrators", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "college_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["college_id"], name: "index_administrators_on_college_id"
    t.index ["user_id"], name: "index_administrators_on_user_id"
  end

  create_table "college_whitelists", force: :cascade do |t|
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "college_id", null: false
    t.index ["college_id"], name: "index_college_whitelists_on_college_id"
    t.index ["user_id", "college_id"], name: "index_college_whitelists_on_user_id_and_college_id", unique: true
    t.index ["user_id"], name: "index_college_whitelists_on_user_id"
  end

  create_table "colleges", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "initials", default: ""
    t.string "city", default: "", null: false
    t.string "state", default: "", null: false
    t.string "country", default: "", null: false
    t.string "unit", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "background_color"
    t.string "font_family"
    t.string "background_image"
    t.string "font_color"
    t.string "request_to_participate"
    t.string "admin_approves_spotted"
    t.index ["user_id"], name: "index_colleges_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "spotted_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spotted_id"], name: "index_comments_on_spotted_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "favorite_colleges", force: :cascade do |t|
    t.integer "college_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorite_spotteds", force: :cascade do |t|
    t.integer "spotted_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "spotted_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spotted_id"], name: "index_likes_on_spotted_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "spotteds", force: :cascade do |t|
    t.text "content"
    t.integer "college_spotted_counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "college_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "image"
    t.index ["college_id"], name: "index_spotteds_on_college_id"
    t.index ["user_id"], name: "index_spotteds_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "password_digest", default: "", null: false
    t.date "birth_date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "nickname", default: "", null: false
    t.string "profile_picture"
    t.string "menu_preference", default: "list"
    t.string "profile_picture_content_type"
  end

  add_foreign_key "administrators", "colleges"
  add_foreign_key "administrators", "users"
  add_foreign_key "college_whitelists", "colleges"
  add_foreign_key "college_whitelists", "users"
  add_foreign_key "colleges", "users"
  add_foreign_key "comments", "spotteds"
  add_foreign_key "comments", "users"
  add_foreign_key "likes", "spotteds"
  add_foreign_key "likes", "users"
  add_foreign_key "spotteds", "colleges"
  add_foreign_key "spotteds", "users"
end
