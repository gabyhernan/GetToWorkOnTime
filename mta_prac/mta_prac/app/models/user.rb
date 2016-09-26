
class User < ApplicationRecord
  #attr_accessor :email, :password, :full_name, :phone_number, :train_lines, :commute_time, :schedule, :zipcode
validates :email, uniqueness: true
has_secure_password



end
