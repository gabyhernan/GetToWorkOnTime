class DropSchedules < ActiveRecord::Migration[5.0]
  def change
    drop_table :schedules
    drop_table :events
  end
end
