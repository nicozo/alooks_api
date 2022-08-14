class AddColumnToApply < ActiveRecord::Migration[6.1]
  def change
    add_column :applies, :is_read, :boolean, default: false
  end
end
