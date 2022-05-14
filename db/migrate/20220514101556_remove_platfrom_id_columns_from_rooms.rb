class RemovePlatfromIdColumnsFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :rooms, :platforms
    remove_reference :rooms, :platform, index: true
  end
end
