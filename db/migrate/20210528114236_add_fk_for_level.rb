class AddFkForLevel < ActiveRecord::Migration[6.1]
  def change
    add_reference :languages, :language_level, foreign_key: true
  end
end
