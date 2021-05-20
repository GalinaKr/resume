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

ActiveRecord::Schema.define(version: 2021_05_20_233144) do

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

  create_table "certifications", force: :cascade do |t|
    t.string "description"
    t.boolean "disable", default: false
    t.boolean "custom", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "changes_in_names", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.string "last_name"
    t.date "date"
    t.integer "reason"
    t.string "document"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_changes_in_names_on_user_id"
  end

  create_table "families", force: :cascade do |t|
    t.string "f_first_name"
    t.string "f_second_name"
    t.string "f_last_name"
    t.date "f_birthday"
    t.string "degree_of_kinship"
    t.string "place_of_work"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "profile_id"
    t.index ["profile_id"], name: "index_families_on_profile_id"
    t.index ["user_id"], name: "index_families_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "lang_know"
    t.string "know_level"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "profile_id"
    t.index ["profile_id"], name: "index_languages_on_profile_id"
  end

  create_table "profile_certifications", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "certification_id", null: false
    t.string "description"
    t.date "earned"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["certification_id"], name: "index_profile_certifications_on_certification_id"
    t.index ["profile_id"], name: "index_profile_certifications_on_profile_id"
  end

  create_table "profile_educations", force: :cascade do |t|
    t.string "institution"
    t.integer "degree"
    t.string "course_of_study"
    t.integer "graduation_year"
    t.boolean "currently_studying", default: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "profile_id"
    t.index ["profile_id"], name: "index_profile_educations_on_profile_id"
  end

  create_table "profile_experiences", force: :cascade do |t|
    t.string "job_title"
    t.string "company"
    t.string "location"
    t.date "start_date"
    t.date "end_date"
    t.boolean "current_job", default: false
    t.text "description"
    t.bigint "profile_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["profile_id"], name: "index_profile_experiences_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "professional_title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.string "current_step"
    t.string "professional_summary"
    t.string "professional_years_experience"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "reasons_of_change_name", force: :cascade do |t|
    t.string "document"
    t.string "reason_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "second_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email"
    t.string "phone_number"
    t.string "location"
    t.datetime "date_of_birth"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "personal_tax_number"
    t.date "birthday"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "changes_in_names", "users"
  add_foreign_key "families", "profiles"
  add_foreign_key "families", "users"
  add_foreign_key "languages", "profiles"
  add_foreign_key "profile_educations", "profiles"
  add_foreign_key "profiles", "users"
end
