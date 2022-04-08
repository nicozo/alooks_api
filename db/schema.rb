# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_04_08_093952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "game_modes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "platforms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rank_tiers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "title", null: false
    t.integer "current_squad_member", null: false
    t.boolean "is_draft", default: false
    t.datetime "application_deadline"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "platform_id", null: false
    t.bigint "game_mode_id", null: false
    t.index ["game_mode_id"], name: "index_rooms_on_game_mode_id"
    t.index ["platform_id"], name: "index_rooms_on_platform_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.string "name", null: false
    t.text "self_introduction"
    t.date "date_of_birth"
    t.integer "sex", default: 0, null: false
    t.integer "role", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "refresh_jti"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "rooms", "game_modes"
  add_foreign_key "rooms", "platforms"
  add_foreign_key "rooms", "users"
end
