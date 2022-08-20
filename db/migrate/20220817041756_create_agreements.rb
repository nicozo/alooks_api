class CreateAgreements < ActiveRecord::Migration[6.1]
  def change
    create_table :agreements do |t|
      t.string :body
      t.string :applicant_id
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
