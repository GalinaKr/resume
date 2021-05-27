class AddFkForDegreeOfKinship < ActiveRecord::Migration[6.1]
  def change
    add_reference :families, :degree_of_kinship, foreign_key: true
  end
end
