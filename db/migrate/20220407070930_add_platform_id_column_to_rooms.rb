class AddPlatformIdColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :platform, null: false, foreign_key: true
  end
end
