class AddFieldsForUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string
    add_column :users, :phone_number, :string
    add_column :users, :location, :string
  end
end
