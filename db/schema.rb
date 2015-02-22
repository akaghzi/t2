# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150215062154) do

  create_table "colours", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "owner"
    t.string   "store"
    t.string   "city"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "customers", ["phone"], name: "index_customers_on_phone", unique: true

  create_table "order_lines", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "colour_id"
    t.integer  "quantity"
    t.decimal  "price",      precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "order_lines", ["colour_id"], name: "index_order_lines_on_colour_id"
  add_index "order_lines", ["order_id"], name: "index_order_lines_on_order_id"
  add_index "order_lines", ["product_id"], name: "index_order_lines_on_product_id"

  create_table "orders", force: :cascade do |t|
    t.integer  "customer_id"
    t.decimal  "order_amount", precision: 10, scale: 2
    t.string   "bill_id"
    t.decimal  "discount",     precision: 2,  scale: 2
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"

  create_table "products", force: :cascade do |t|
    t.string   "code",          limit: 20
    t.string   "specification"
    t.decimal  "price",                    precision: 10, scale: 2
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "products", ["code"], name: "index_products_on_code", unique: true

end
