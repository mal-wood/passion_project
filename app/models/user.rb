require 'bcrypt'

class User < ActiveRecord::Base 
	validates :first_name, :last_name, :email, presence: true
	validates :email, uniqueness: true
  validates :password_hash, presence: true
   
  include BCrypt

  def password 
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email, new_password)
     user = User.find_by(email: email)
     if user && user.password == new_password
       return user
     else
       nil
     end
   end
end 
