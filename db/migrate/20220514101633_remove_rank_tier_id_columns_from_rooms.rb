class RemoveRankTierIdColumnsFromRooms < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :rooms, :rank_tiers
    remove_reference :rooms, :rank_tier, index: true
  end
end
