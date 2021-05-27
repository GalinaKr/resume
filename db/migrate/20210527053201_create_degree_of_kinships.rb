class CreateDegreeOfKinships < ActiveRecord::Migration[6.1]
  def change
    create_table :degree_of_kinships do |t|
      t.string :description

      t.timestamps
    end
  end
end
