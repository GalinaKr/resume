class ChangesInNames < ActiveRecord::Migration[6.1]
  def change
    create_table :changes_in_names do |t|
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.date :date
      t.integer :reason
      t.string :document

      t.timestamps
    end
  end
end
