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

ActiveRecord::Schema.define(version: 2021_07_02_194449) do

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

  create_table "jwt_denylist", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "expirated_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["jti"], name: "index_jwt_denylist_on_jti"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_pets_on_name", unique: true
  end

  create_table "pets_background_answers", force: :cascade do |t|
    t.string "answer", null: false
    t.bigint "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_pets_background_answers_on_question_id"
  end

  create_table "pets_background_questions", force: :cascade do |t|
    t.string "question", default: "", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pets_backstories", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.string "body", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_pets_backstories_on_pet_id"
  end

  create_table "pets_images", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.integer "trait", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_pets_images_on_pet_id"
  end

  create_table "user_notifications", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "message", default: "", null: false
    t.integer "status", default: 0
    t.string "notifiable_type"
    t.bigint "notifiable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["notifiable_type", "notifiable_id"], name: "index_user_notifications_on_notifiable"
    t.index ["user_id"], name: "index_user_notifications_on_user_id"
  end

  create_table "user_pet_backgrounds", force: :cascade do |t|
    t.bigint "pet_id", null: false
    t.bigint "question_id", null: false
    t.bigint "answer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_user_pet_backgrounds_on_answer_id"
    t.index ["pet_id"], name: "index_user_pet_backgrounds_on_pet_id"
    t.index ["question_id"], name: "index_user_pet_backgrounds_on_question_id"
  end

  create_table "user_pet_battle_actions", force: :cascade do |t|
    t.bigint "battle_id", null: false
    t.integer "weapon", default: 0
    t.integer "damage", default: 0, null: false
    t.bigint "attacker_id", null: false
    t.bigint "attackee_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["attackee_id"], name: "index_user_pet_battle_actions_on_attackee_id"
    t.index ["attacker_id"], name: "index_user_pet_battle_actions_on_attacker_id"
    t.index ["battle_id"], name: "index_user_pet_battle_actions_on_battle_id"
  end

  create_table "user_pet_battles", force: :cascade do |t|
    t.bigint "winner_id"
    t.bigint "opponent_id", null: false
    t.bigint "challenger_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["challenger_id"], name: "index_user_pet_battles_on_challenger_id"
    t.index ["opponent_id"], name: "index_user_pet_battles_on_opponent_id"
    t.index ["winner_id"], name: "index_user_pet_battles_on_winner_id"
  end

  create_table "user_pets", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "pet_id", null: false
    t.string "name", default: "", null: false
    t.string "gender", default: "", null: false
    t.integer "health", default: 0, null: false
    t.integer "attack", default: 0, null: false
    t.integer "hunger", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pet_id"], name: "index_user_pets_on_pet_id"
    t.index ["user_id"], name: "index_user_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "username", default: "", null: false
    t.boolean "admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "pets_background_answers", "pets_background_questions", column: "question_id"
  add_foreign_key "pets_backstories", "pets"
  add_foreign_key "pets_images", "pets"
  add_foreign_key "user_notifications", "users"
  add_foreign_key "user_pet_backgrounds", "pets_background_answers", column: "answer_id"
  add_foreign_key "user_pet_backgrounds", "pets_background_questions", column: "question_id"
  add_foreign_key "user_pet_backgrounds", "user_pets", column: "pet_id"
  add_foreign_key "user_pet_battle_actions", "user_pet_battles", column: "battle_id"
  add_foreign_key "user_pet_battle_actions", "user_pets", column: "attackee_id"
  add_foreign_key "user_pet_battle_actions", "user_pets", column: "attacker_id"
  add_foreign_key "user_pet_battles", "user_pets", column: "challenger_id"
  add_foreign_key "user_pet_battles", "user_pets", column: "opponent_id"
  add_foreign_key "user_pet_battles", "user_pets", column: "winner_id"
  add_foreign_key "user_pets", "pets"
  add_foreign_key "user_pets", "users"
end
