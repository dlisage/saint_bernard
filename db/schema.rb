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

ActiveRecord::Schema.define(version: 2019_10_06_055640) do

  create_table "admissions", force: :cascade do |t|
    t.datetime "moment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "allergies", force: :cascade do |t|
    t.text "description"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_allergies_on_patient_id"
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "coding_system"
    t.string "code"
    t.text "description"
    t.integer "patient_id"
    t.integer "admission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission_id"], name: "index_diagnoses_on_admission_id"
    t.index ["patient_id"], name: "index_diagnoses_on_patient_id"
  end

  create_table "diagnostic_procedures", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_diagnostic_procedures_on_patient_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_orders", force: :cascade do |t|
    t.string "name", limit: 100
    t.integer "unit"
    t.decimal "dosage"
    t.integer "route"
    t.integer "order_frequency_id"
    t.integer "patient_id"
    t.text "necessity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_medication_orders_on_patient_id"
  end

  create_table "observations", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.integer "admission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission_id"], name: "index_observations_on_admission_id"
  end

  create_table "order_frequencies", force: :cascade do |t|
    t.string "value"
    t.integer "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name", limit: 50
    t.string "middle_name", limit: 50
    t.string "last_name", limit: 50
    t.string "mr", limit: 50
    t.datetime "dob"
    t.integer "gender"
    t.integer "admission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission_id"], name: "index_patients_on_admission_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.text "description"
    t.integer "admission_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admission_id"], name: "index_symptoms_on_admission_id"
  end

  create_table "treatments", force: :cascade do |t|
    t.text "description"
    t.text "necessity"
    t.integer "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_treatments_on_patient_id"
  end

end
