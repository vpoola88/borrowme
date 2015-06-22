
get '/categories' do

  redirect '/login' unless current_user

  @categories = Category.all

  erb :categories

end


get '/categories/new' do

  redirect '/login' unless session[:user_id]

  @categories = Category.all

  erb :new_category

  # erb :new_category, layout: false, local: {categories: @categories}

end


post '/categories' do

  redirect '/login' unless session[:user_id]

  @category = Category.create(title: params[:title], description: params[:description], user_id: session[:user_id])

  redirect '/categories'

end










