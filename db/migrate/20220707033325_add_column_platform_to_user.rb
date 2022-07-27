class AddColumnPlatformToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :platform, :integer, default: 0, null: false
  end
end
