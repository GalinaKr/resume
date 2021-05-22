class AddGeoLocationsToProfileExperience < ActiveRecord::Migration[6.1]
  def change
    add_column :profile_experiences, :latitude, :float
    add_column :profile_experiences, :longitude, :float
    add_index :profile_experiences, %i[latitude longitude]

    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_index :users, %i[latitude longitude]
  end
end
