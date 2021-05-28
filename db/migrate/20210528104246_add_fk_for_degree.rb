class AddFkForDegree < ActiveRecord::Migration[6.1]
  def change
    add_reference :profile_educations, :degree, foreign_key: true
  end
end
