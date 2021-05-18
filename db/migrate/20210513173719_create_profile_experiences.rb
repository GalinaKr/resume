class CreateProfileExperiences < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_experiences do |t|
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
  end
end
