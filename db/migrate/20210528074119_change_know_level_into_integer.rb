class ChangeKnowLevelIntoInteger < ActiveRecord::Migration[6.1]
  def change
    remove_column :languages, :know_level, :string
    add_column :languages, :level, :integer
  end
end
