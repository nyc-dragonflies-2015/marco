require 'bcrypt'
class User < ActiveRecord::Base
  include BCrypt

  has_many :posts
  has_many :comments

  validates :name, length: {minimum: 3}
  validates :password, length: {minimum: 3}
  validates :email, presence: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(plaintext_password)
    self.password == plaintext_password
  end
end
