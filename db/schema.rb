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

ActiveRecord::Schema.define(version: 2020_01_14_143327) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blood_types", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_blood_types_on_code", unique: true
  end

  create_table "card_types", force: :cascade do |t|
    t.string "code", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_card_types_on_code", unique: true
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "passenger_id"
    t.string "origin"
    t.string "destination"
    t.string "distance"
    t.string "minute_time"
    t.string "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["passenger_id"], name: "index_contracts_on_passenger_id"
    t.index ["user_id"], name: "index_contracts_on_user_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "identification", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["identification"], name: "index_passengers_on_identification", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "blood_type_id"
    t.bigint "card_type_id"
    t.string "identification", null: false
    t.string "rol", null: false
    t.string "property_card"
    t.string "license"
    t.string "phone"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blood_type_id"], name: "index_users_on_blood_type_id"
    t.index ["card_type_id"], name: "index_users_on_card_type_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["identification"], name: "index_users_on_identification", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contracts", "passengers"
  add_foreign_key "contracts", "users"
  add_foreign_key "users", "blood_types"
  add_foreign_key "users", "card_types"
end
