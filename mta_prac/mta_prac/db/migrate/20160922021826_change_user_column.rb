class ChangeUserColumn < ActiveRecord::Migration[5.0]
  def change
    change_column :users, :phone_number, :integer , :limit => 10
    change_column :users, :zipcode, :integer, :limit => 5
  end
end
