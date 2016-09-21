class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email , unique: true, null: false
      t.string :password , null: false
      t.string :full_name
      t.integer :phone_number
      t.string :train_lines
      t.integer :commute_time
      t.text :schedule
      t.integer :zipcode

      t.timestamps
    end
  end
end
