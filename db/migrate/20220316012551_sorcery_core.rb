class SorceryCore < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email,            null: false, index: { unique: true }
      t.string :crypted_password
      t.string :salt

      t.string :name,             null: false
      t.text   :self_introduction
      t.date   :date_of_birth,    null: false
      t.integer :sex,             null: false, default: 0
      t.integer :role,            null: false, default: 0

      t.timestamps                null: false
    end
  end
end
