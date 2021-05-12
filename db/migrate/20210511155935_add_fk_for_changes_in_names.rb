class AddFkForChangesInNames < ActiveRecord::Migration[6.1]
  def change
    add_reference :changes_in_names, :user, foreign_key: true
  end
end
