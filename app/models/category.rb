class Category < ActiveRecord::Base

  has_many :items
  has_many :category_users
  has_many :users, :through => :category_users

  validates :title, :uniqueness => true, presence: true, length: {minimum: 3}
  validates :description, presence: true

end