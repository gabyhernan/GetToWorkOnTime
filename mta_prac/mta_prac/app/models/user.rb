include HTTParty
class User < ApplicationRecord
validates :email, uniqueness: true
has_secure_password


def start_the_party(url)

end



end
