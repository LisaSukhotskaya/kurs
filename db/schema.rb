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

ActiveRecord::Schema.define(version: 20171020153642) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clothes", force: :cascade do |t|
    t.string "brand"
    t.string "description"
    t.string "color"
    t.string "size"
    t.float "cost", default: 0, null: false
    t.string "print"
    t.string "cloth"
    t.integer "quantity", default: 0, null: false
    t.string "gender"
    t.string "type"
    t.string "basket_item_size"
    t.integer "basket_count", default: 0, null: false
    t.boolean "basket", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_uid"
  end

  create_table "orders", force: :cascade do |t|
    t.string "client_first_name"
    t.string "client_last_name"
    t.string "client_phone"
    t.string "client_address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "role", default: "client"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
