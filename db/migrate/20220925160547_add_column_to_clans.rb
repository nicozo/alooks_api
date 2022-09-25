class AddColumnToClans < ActiveRecord::Migration[6.1]
  def change
    add_column :clans, :enrollment, :string, null: false
    add_column :clans, :activity_time, :string, null: false
    add_column :clans, :enrollment_age, :string, null: false
    add_column :clans, :snipe, :string, null: false
    add_column :clans, :contact_means, :string, null: false
    add_column :clans, :platform, :integer, null: false, default: 0
    add_column :clans, :age, :integer, null: false, default: 0
    add_column :clans, :required_login, :integer, null: false, default: 0
    add_column :clans, :required_ranked, :integer, null: false, default: 0
    add_column :clans, :required_vc, :boolean, null: false, default: true
    add_column :clans, :personality, :string, null: false, default: 0
  end
end
