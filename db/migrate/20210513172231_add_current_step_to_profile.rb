class AddCurrentStepToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :current_step, :string
  end
end
