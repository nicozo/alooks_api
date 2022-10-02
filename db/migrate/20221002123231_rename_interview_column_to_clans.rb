class RenameInterviewColumnToClans < ActiveRecord::Migration[6.1]
  def change
    rename_column :clans, :interview, :joining_process
  end
end
