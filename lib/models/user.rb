require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: "Sorry, your passwords don't match!"

  has n, :posts, through: Resource

  property :id, Serial
  property :email, String, unique: true, message: "Sorry, that email is already taken!"
  property :password_digest, Text
  property :name, String
  property :username, String, unique: true, message: "Sorry, that username is already taken!"

  def password= password
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate username, password
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end