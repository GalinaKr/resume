class CreateProfileCertifications < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_certifications do |t|
      t.bigint "profile_id", null: false
      t.bigint "certification_id", null: false
      t.string "description"
      t.date "earned"
      t.index ["certification_id"], name: "index_profile_certifications_on_certification_id"
      t.index ["profile_id"], name: "index_profile_certifications_on_profile_id"

      t.timestamps
    end
  end
end
