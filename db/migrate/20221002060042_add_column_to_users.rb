class AddColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :kd, :float
    add_column :users, :highest_damage, :integer
    add_column :users, :favorite_weapon, :integer
  end
end
