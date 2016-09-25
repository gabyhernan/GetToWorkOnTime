include HTTParty
class User < ApplicationRecord
  #attr_accessor :email, :password, :full_name, :phone_number, :train_lines, :commute_time, :schedule, :zipcode
validates :email, uniqueness: true
has_secure_password


def start_the_party(url)

end



end
