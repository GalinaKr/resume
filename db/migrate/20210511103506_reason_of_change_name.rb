class ReasonOfChangeName < ActiveRecord::Migration[6.1]
  def change
    create_table :reasons_of_change_name do |t|
      t.string :document
      t.string :reason_description

      t.timestamps
    end
  end
end
