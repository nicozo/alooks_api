class ChangeGameIdColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :game_id, :string
  end
end
