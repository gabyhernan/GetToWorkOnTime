require 'bcrypt'
class User < ApplicationRecord
  validates :email, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password = @password
  end

end
