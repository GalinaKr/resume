class CreateLanguageLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :language_levels do |t|
      t.string :description_en
      t.string :description_ru
      t.string :description_ua

      t.timestamps
    end
  end
end
