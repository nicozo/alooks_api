class CreateClans < ActiveRecord::Migration[6.1]
  def change
    create_table :clans do |t|
      t.string :name,               null: false
      t.string :concept,            null: false
      t.string :interview,          null: false
      t.string :prohibited_matters, null: false
      t.references :user,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
