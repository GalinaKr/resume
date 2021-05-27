class AddTranslationDegreeOfKinship < ActiveRecord::Migration[6.1]
  def change
    add_column :degree_of_kinships, :description_en, :string
    add_column :degree_of_kinships, :description_ru, :string
    add_column :degree_of_kinships, :description_ua, :string

    DegreeOfKinship.update_all("description_en=description")
  end
end
