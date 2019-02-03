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

ActiveRecord::Schema.define(version: 2019_02_03_215612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffee_shop_items", force: :cascade do |t|
    t.bigint "coffee_shop_id"
    t.bigint "order_items_id"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "HRK", null: false
    t.boolean "available", default: true
    t.boolean "special_deal", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coffee_shop_id"], name: "index_coffee_shop_items_on_coffee_shop_id"
    t.index ["order_items_id"], name: "index_coffee_shop_items_on_order_items_id"
  end

  create_table "coffee_shops", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "location_id", null: false
    t.date "paid_till"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_coffee_shops_on_location_id"
    t.index ["user_id"], name: "index_coffee_shops_on_user_id"
  end

  create_table "coffee_tables", force: :cascade do |t|
    t.bigint "coffee_shop_id"
    t.string "qr_code"
    t.string "qr_code_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coffee_shop_id"], name: "index_coffee_tables_on_coffee_shop_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "street", null: false
    t.integer "street_number", null: false
    t.integer "zip_code", null: false
    t.string "country", null: false
    t.string "coordinates", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "coffee_shop_id"
    t.bigint "coffee_tables_id"
    t.boolean "finished"
    t.date "finished_at"
    t.integer "total_price_cents", default: 0, null: false
    t.string "total_price_currency", default: "HRK", null: false
    t.integer "discount_price_cents", default: 0, null: false
    t.string "discount_price_currency", default: "HRK", null: false
    t.string "payment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coffee_shop_id"], name: "index_orders_on_coffee_shop_id"
    t.index ["coffee_tables_id"], name: "index_orders_on_coffee_tables_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "coffee_shops", "locations"
  add_foreign_key "coffee_shops", "users"
end
