class RemoveNotNullFromColumnOfClans < ActiveRecord::Migration[6.1]
  def up
    change_column_null :clans, :joining_process, true
    change_column_null :clans, :prohibited_matters, true
    change_column_null :clans, :enrollment, true
    change_column_null :clans, :activity_time, true
    change_column_null :clans, :enrollment_age, true
    change_column_null :clans, :snipe, true
    change_column_null :clans, :contact_means, true
    change_column_null :clans, :personality, true
  end

  def down
    change_column_null :clans, :joining_process, false
    change_column_null :clans, :prohibited_matters, false
    change_column_null :clans, :enrollment, false
    change_column_null :clans, :activity_time, false
    change_column_null :clans, :enrollment_age, false
    change_column_null :clans, :snipe, false
    change_column_null :clans, :contact_means, false
    change_column_null :clans, :personality, false
  end
end
