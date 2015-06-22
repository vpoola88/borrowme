class User < ActiveRecord::Base
  
  has_many :items
  has_many :categories

  validates :username, :presence => true, :uniqueness => true
  validates :name, :presence => true
  validates :password, :presence => true

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = User.where(username: username).first
    if user && user.password == password
      return user
    else
      return nil
    end
  end

end
