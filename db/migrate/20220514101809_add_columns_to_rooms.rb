class AddColumnsToRooms < ActiveRecord::Migration[6.1]
  def change
    add_column :rooms, :platform, :integer, null: false, default: 1, after: :recruitment_number
    add_column :rooms, :game_mode, :integer, null: false, default: 1, after: :recruitment_number
    add_column :rooms, :rank_tier, :integer, null: false, default: 1, after: :recruitment_number
  end
end
