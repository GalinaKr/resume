class AddUidAndProvider < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :uid, :varchar
    add_column :users, :provider, :varchar
  end
end
