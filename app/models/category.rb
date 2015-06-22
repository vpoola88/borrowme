class Category < ActiveRecord::Base
  has_many :items

  validates :title, :uniqueness => true, presence: true, length: {minimum: 3}
  validates :description, presence: true
end


# <form action="/results" method="post">
#   <input type="text" name="tag" placeholder="BUDDY TIME">
#   <input type="submit" >
# </form></h4>
