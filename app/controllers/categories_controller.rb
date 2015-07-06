
# get '/categories' do
#   redirect '/login' unless current_user
#   @categories = current_user.categories
#   erb :categories
# end


# get '/categories/new' do
#   redirect '/login' unless session[:user_id]
#   cat = current_user.categories
#   erb :new_category, layout: false, local: {categories: cat}
# end


# post '/categories' do
#   category = Category.find_by(title: params[:title])
#   if category == nil
#     category = Category.create(title: params[:title], description: params[:description])
#   end
#   if CategoryUser.find_by(user_id: current_user.id, category_id: category.id) == nil
#     CategoryUser.create(user_id: current_user.id, category_id: category.id)
#     erb :_category, layout: false, locals: {category_new: category}
#   else
#     status 400
#   end
# end










