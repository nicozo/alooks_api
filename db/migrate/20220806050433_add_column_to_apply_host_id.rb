class AddColumnToApplyHostId < ActiveRecord::Migration[6.1]
  def change
    add_column :applies, :host_id, :integer
  end
end
