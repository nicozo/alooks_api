class DropInformations < ActiveRecord::Migration[6.1]
  def change
    drop_table :information do |t|
      t.string :enrollment,      null: false
      t.string :activity_time,   null: false
      t.string :enrollment_age,  null: false
      t.string :snipe,           null: false
      t.string :contact_means,   null: false
      t.references :clan,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
