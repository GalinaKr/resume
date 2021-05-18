class AdFkToProfileForEducation < ActiveRecord::Migration[6.1]
  def change
    add_reference :profile_educations, :profile, foreign_key: true
  end
end
