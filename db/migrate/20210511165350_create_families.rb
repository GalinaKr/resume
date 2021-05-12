class CreateFamilies < ActiveRecord::Migration[6.1]
  def change
    create_table :families do |t|
      t.string :f_first_name
      t.string :f_second_name
      t.string :f_last_name
      t.date :f_birthday

      t.string :degree_of_kinship

      t.string :place_of_work

      t.timestamps
    end
  end
end
