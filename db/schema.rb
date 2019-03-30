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

ActiveRecord::Schema.define(version: 2019_03_30_160147) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type"
    t.bigint "addressable_id"
    t.string "city"
    t.string "street_name"
    t.string "street_no"
    t.string "postal_code"
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "doctor_id"
    t.bigint "nurse_id"
    t.bigint "reservation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["doctor_id"], name: "index_appointments_on_doctor_id"
    t.index ["nurse_id"], name: "index_appointments_on_nurse_id"
    t.index ["reservation_id"], name: "index_appointments_on_reservation_id"
  end

  create_table "bill_items", force: :cascade do |t|
    t.string "name"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "bill_items_bills", id: false, force: :cascade do |t|
    t.bigint "bill_id", null: false
    t.bigint "bill_item_id", null: false
    t.index ["bill_id", "bill_item_id"], name: "index_bill_items_bills_on_bill_id_and_bill_item_id"
  end

  create_table "bills", force: :cascade do |t|
    t.bigint "appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_bills_on_appointment_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "pesel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "reservation_time"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_reservations_on_patient_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "pesel"
    t.integer "occupation", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "reservations"
  add_foreign_key "bills", "appointments"
  add_foreign_key "reservations", "patients"
end
