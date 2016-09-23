class DropScheduleAddWeekdays < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :schedule, :string
    add_column :users, :monday, :string
    add_column :users, :tuesday, :string
    add_column :users, :wednesday, :string
    add_column :users, :thursday, :string
    add_column :users, :friday, :string
    add_column :users, :saturday, :string
    add_column :users, :sunday, :string


  end
end
