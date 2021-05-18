class CreateCertifications < ActiveRecord::Migration[6.1]
  def change
    create_table :certifications do |t|
      t.string "description"
      t.boolean "disable", default: false
      t.boolean "custom", default: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
