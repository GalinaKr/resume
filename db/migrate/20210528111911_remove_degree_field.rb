class RemoveDegreeField < ActiveRecord::Migration[6.1]
  def change
    remove_column :profile_educations, :degree, :integer
  end
end
