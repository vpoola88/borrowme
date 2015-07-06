class User < ActiveRecord::Base
  
  has_many :items
  has_many :category_users
  has_many :categories, :through => :category_users

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


  has_many  :friendships
  has_many  :friends, :through => :friendships

  def accepted_friends
    friendships = Friendship.where("(friendships.user_id = #{self.id} OR friendships.friend_id = #{self.id}) AND friendships.accepted = true")
    accepted_friends = []
    friendships.each do |friendship|
      accepted_friends << User.find(friendship.user_id) if self.id != User.find(friendship.user_id).id
      accepted_friends << User.find(friendship.friend_id) if self.id != User.find(friendship.friend_id).id
    end
    return accepted_friends
  end

  def pending_friends
    friendships = Friendship.where("friendships.user_id = #{self.id} AND friendships.accepted = false")
    pending_friends = []
    friendships.each do |friendship|
      pending_friends << User.find(friendship.friend_id)
    end
    return pending_friends
  end

  def friend_requests
    friendships = Friendship.where("friendships.friend_id = #{self.id} AND friendships.accepted = false")
    friend_requests = []
    friendships.each do |friendship|
      friend_requests << User.find(friendship.user_id)
    end
    return friend_requests
  end

end