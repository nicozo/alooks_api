class AddUniqueToApply < ActiveRecord::Migration[6.1]
  def change
    add_index :applies, [:user_id, :room_id], unique: true
  end
end
