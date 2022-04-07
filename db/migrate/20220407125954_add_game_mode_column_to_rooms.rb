class AddGameModeColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :game_mode, null: false, foreign_key: true
  end
end
