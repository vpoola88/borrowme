class Category < ActiveRecord::Base
  has_many :items
end


# <form action="/results" method="post">
#   <input type="text" name="tag" placeholder="BUDDY TIME">
#   <input type="submit" >
# </form></h4>
