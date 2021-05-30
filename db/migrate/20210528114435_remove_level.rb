class RemoveLevel < ActiveRecord::Migration[6.1]
  def change
    remove_column :languages, :level, :integer
  end
end
