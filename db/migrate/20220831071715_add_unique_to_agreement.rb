class AddUniqueToAgreement < ActiveRecord::Migration[6.1]
  def change
    add_index :agreements, [:room_id, :applicant_id], unique: true
  end
end
