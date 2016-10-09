require 'bcrypt'

class User < ActiveRecord::Base 
	validates :first_name, :last_name, :email, presence: true
	validates :email, uniqueness: true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, password)
     user = User.find_by(email: email)
     if user && user.password == Password.new(password)
       return user
     else
       return nil
     end
   end
end 
