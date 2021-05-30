class AddFkForFormOfEducation < ActiveRecord::Migration[6.1]
  def change
    add_reference :profile_educations, :form_of_education, foreign_key: true
  end
end
