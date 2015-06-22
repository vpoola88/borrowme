
get '/categories' do

  redirect '/login' unless current_user

  @categories = Category.where(user_id: session[:user_id])

  erb :categories

end


get '/categories/new' do

  redirect '/login' unless session[:user_id]

  @categories = Category.all

  # erb :new_category

  erb :new_category, layout: false, local: {categories: @categories}

end


post '/categories' do

  @category = Category.create(title: params[:title], description: params[:description], user_id: session[:user_id])

  p params

  p @category 

  erb :_category, layout: false, locals: {category: @category}

end










