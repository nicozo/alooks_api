class CreateConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :conditions do |t|
      t.integer :platform, null: false, default: 0
      t.integer :age, null: false, default: 0
      t.integer :required_login, null: false, default: 0
      t.integer :required_ranked, null: false, default: 0
      t.boolean :required_vc, null: false, default: true
      t.string :personality, null: false
      t.references :clan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
