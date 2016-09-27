class AddNullValues < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :phone_number, :integer, null: false
    change_column_null :users, :commute_time, :integer, null: false
    change_column_null :users, :password_digest, :string, null: false
  end

end
