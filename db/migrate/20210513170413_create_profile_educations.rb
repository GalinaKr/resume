class CreateProfileEducations < ActiveRecord::Migration[6.1]
  def change
    create_table :profile_educations do |t|
      t.string "institution"
      t.integer "degree"
      t.string "course_of_study"
      t.integer "graduation_year"
      t.boolean "currently_studying", default: false
      t.text "description"

      t.timestamps
    end
  end
end
