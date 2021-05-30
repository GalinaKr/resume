class AddColumnFormEducation < ActiveRecord::Migration[6.1]
  def change
    add_column :profile_educations, :form_education, :integer
  end
end
