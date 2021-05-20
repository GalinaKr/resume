class AddFieldsToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :professional_summary, :string
    add_column :profiles, :professional_years_experience, :string
  end
end
