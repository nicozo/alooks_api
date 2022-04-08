class AddRankTierIdColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    add_reference :rooms, :rank_tier, null: false, foreign_key: true
  end
end
