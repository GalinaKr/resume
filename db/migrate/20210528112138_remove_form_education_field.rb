class RemoveFormEducationField < ActiveRecord::Migration[6.1]
  def change
    remove_column :profile_educations, :form_education, :integer
  end
end
