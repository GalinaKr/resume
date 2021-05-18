class AddFkForFamilyIntoProfile < ActiveRecord::Migration[6.1]
  def change
    add_reference :families, :profile, foreign_key: true
  end
end
