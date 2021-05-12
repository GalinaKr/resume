class AddFkToUsersForFamily < ActiveRecord::Migration[6.1]
  def change
    add_reference :families, :user, foreign_key: true
  end
end
