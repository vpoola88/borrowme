class Category < ActiveRecord::Base

  has_many :items

  validates :title, :uniqueness => true, presence: true, length: {minimum: 3}
  validates :description, presence: true

end