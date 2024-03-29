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

ActiveRecord::Schema.define(version: 2022_12_31_140705) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "agreements", force: :cascade do |t|
    t.string "body"
    t.integer "applicant_id"
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["room_id", "applicant_id"], name: "index_agreements_on_room_id_and_applicant_id", unique: true
    t.index ["room_id"], name: "index_agreements_on_room_id"
    t.index ["user_id"], name: "index_agreements_on_user_id"
  end

  create_table "applies", force: :cascade do |t|
    t.string "body", null: false
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "host_id", null: false
    t.boolean "is_read", default: false
    t.index ["room_id"], name: "index_applies_on_room_id"
    t.index ["user_id", "room_id"], name: "index_applies_on_user_id_and_room_id", unique: true
    t.index ["user_id"], name: "index_applies_on_user_id"
  end

  create_table "clans", force: :cascade do |t|
    t.string "name", null: false
    t.string "concept", null: false
    t.string "joining_process"
    t.string "prohibited_matters"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "enrollment"
    t.string "activity_time"
    t.string "enrollment_age"
    t.string "snipe"
    t.string "contact_means"
    t.integer "platform", default: 0, null: false
    t.integer "age", default: 0, null: false
    t.integer "required_login", default: 0, null: false
    t.integer "required_ranked", default: 0, null: false
    t.boolean "required_vc", default: true, null: false
    t.string "personality"
    t.index ["user_id"], name: "index_clans_on_user_id"
  end

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

  create_table "players", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_players_on_user_id"
  end

  create_table "rank_tiers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rooms", force: :cascade do |t|
    t.string "title", null: false
    t.integer "recruitment_number", null: false
    t.boolean "is_draft", default: false
    t.datetime "application_deadline"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "platform", default: 0, null: false
    t.integer "game_mode", default: 0, null: false
    t.integer "rank_tier", default: 0, null: false
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
    t.string "game_id"
    t.integer "platform", default: 0, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.float "kd"
    t.integer "highest_damage"
    t.string "favorite_weapons"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agreements", "rooms"
  add_foreign_key "agreements", "users"
  add_foreign_key "applies", "rooms"
  add_foreign_key "applies", "users"
  add_foreign_key "clans", "users"
  add_foreign_key "players", "users"
  add_foreign_key "rooms", "users"
end
