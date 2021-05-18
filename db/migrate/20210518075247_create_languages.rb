class CreateLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :languages do |t|
      t.string :lang_know
      t.string :know_level

      t.timestamps
    end
  end
end
