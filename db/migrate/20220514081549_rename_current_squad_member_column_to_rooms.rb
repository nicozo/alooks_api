class RenameCurrentSquadMemberColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :current_squad_member, :recruitment_number
  end
end
