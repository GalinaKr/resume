class AddFieldPersonalTaxNumber < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :personal_tax_number, :string
    add_column :users, :birthday, :date
  end
end
