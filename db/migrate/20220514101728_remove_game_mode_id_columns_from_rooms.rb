class RemoveGameModeIdColumnsFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :rooms, :game_modes
    remove_reference :rooms, :game_mode, index: true
  end
end
