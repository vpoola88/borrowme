
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

  all_categories = Category.where(title: params[:title])

  all_categories.each do |category|

    if category.user_id == current_user.id
      @errors = "Category already exists!"
    else
      @category = Category.create(title: params[:title], description: params[:description], user_id: session[:user_id])
      erb :_category, layout: false, locals: {category: @category}
    end

  end


end










