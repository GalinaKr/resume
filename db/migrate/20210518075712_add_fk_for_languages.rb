class AddFkForLanguages < ActiveRecord::Migration[6.1]
  def change
    add_reference :languages, :profile, foreign_key: true
  end
end
