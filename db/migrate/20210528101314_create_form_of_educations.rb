class CreateFormOfEducations < ActiveRecord::Migration[6.1]
  def change
    create_table :form_of_educations do |t|
      t.string :description_en
      t.string :description_ru
      t.string :description_ua

      t.timestamps
    end
  end
end
