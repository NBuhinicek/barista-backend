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

ActiveRecord::Schema.define(version: 2019_23_02_193208) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffee_shop_item_prices", force: :cascade do |t|
    t.bigint "coffee_shop_id"
    t.bigint "coffee_shop_item_id"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "HRK", null: false
    t.boolean "available", default: true
    t.boolean "special_deal", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coffee_shop_id"], name: "index_coffee_shop_item_prices_on_coffee_shop_id"
    t.index ["coffee_shop_item_id"], name: "index_coffee_shop_item_prices_on_coffee_shop_item_id"
  end

  create_table "coffee_shop_items", force: :cascade do |t|
    t.string "name"
    t.string "item_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coffee_shops", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "location_id", null: false
    t.string "name"
    t.integer "number_of_tables"
    t.date "paid_till"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "approved", default: false
    t.string "image_data"
    t.index ["location_id"], name: "index_coffee_shops_on_location_id"
    t.index ["user_id"], name: "index_coffee_shops_on_user_id"
  end

  create_table "coffee_tables", force: :cascade do |t|
    t.bigint "coffee_shop_id"
    t.integer "table_number"
    t.string "qr_code"
    t.string "qr_code_hash"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coffee_shop_id"], name: "index_coffee_tables_on_coffee_shop_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "street", null: false
    t.integer "zip_code", null: false
    t.string "county", null: false
    t.string "country", null: false
    t.string "coordinates"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "order_id"
    t.bigint "coffee_shop_item_id"
    t.integer "quantity"
    t.integer "price_cents", default: 0, null: false
    t.string "price_currency", default: "HRK", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coffee_shop_item_id"], name: "index_order_items_on_coffee_shop_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["user_id"], name: "index_order_items_on_user_id"
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
    t.boolean "banned", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token", default: "", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["token"], name: "index_users_on_token", unique: true
  end

  add_foreign_key "coffee_shops", "locations"
  add_foreign_key "coffee_shops", "users"
end
