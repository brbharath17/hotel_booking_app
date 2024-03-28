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

ActiveRecord::Schema[7.1].define(version: 2024_03_27_184007) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "hotel_id", null: false
    t.bigint "user_id", null: false
    t.integer "status", default: 0, null: false
    t.integer "paid_status", default: 0, null: false
    t.date "check_in", null: false
    t.date "check_out", null: false
    t.integer "number_of_guests", null: false
    t.integer "number_of_rooms", null: false
    t.decimal "total_price", precision: 20, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id"], name: "index_bookings_on_hotel_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "state", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "state", "country"], name: "index_cities_on_name_and_state_and_country", unique: true
  end

  create_table "hotels", force: :cascade do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.string "phone", null: false
    t.bigint "city_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price_per_room", precision: 20, scale: 2, default: "0.0", null: false
    t.index ["city_id"], name: "index_hotels_on_city_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "hotel_id", null: false
    t.string "number", null: false
    t.integer "floor", null: false
    t.integer "beds", limit: 2, null: false
    t.decimal "price", precision: 15, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hotel_id", "number"], name: "index_rooms_on_hotel_id_and_number", unique: true
    t.index ["hotel_id"], name: "index_rooms_on_hotel_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookings", "hotels"
  add_foreign_key "bookings", "users"
  add_foreign_key "hotels", "cities"
  add_foreign_key "rooms", "hotels"
end
