class CreateConditions < ActiveRecord::Migration[6.1]
  def change
    create_table :conditions do |t|
      t.integer :platform
      t.integer :age
      t.integer :required_login
      t.integer :required_ranked
      t.boolean :required_vc
      t.string :personality
      t.references :clan, null: false, foreign_key: true

      t.timestamps
    end
  end
end
