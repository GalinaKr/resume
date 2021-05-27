class RemoveDescriptionColumnInDegreeOfKinship < ActiveRecord::Migration[6.1]
  def change
    remove_column :degree_of_kinships, :description, :string
  end
end
