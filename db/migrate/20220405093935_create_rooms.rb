class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :title,                  null: false
      t.integer :current_squad_member,  null: false
      t.boolean :is_draft
      t.datetime :application_deadline

      t.timestamps
    end
  end
end
