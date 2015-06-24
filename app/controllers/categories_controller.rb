
get '/categories' do

  redirect '/login' unless current_user

  # p '*' * 100
  # p current_user.categories
  # p '*' * 100

  @categories = current_user.categories
  
  erb :categories

end


get '/categories/new' do
  redirect '/login' unless session[:user_id]
  cat = current_user.categories

  # erb :new_category

  erb :new_category, layout: false, local: {categories: cat}

end


post '/categories' do

  # all_categories = Category.where(title: params[:title])

  # all_categories.each do |category|

  #   if category.user_id == current_user.id
  #     @errors = "Category already exists!"
  #   else
  #   end

  #   p @category

  # end

  # content_type :json

  category = Category.find_by(title: params[:title])

  if category == nil

    category = Category.create(title: params[:title], description: params[:description])

  end


  if CategoryUser.find_by(user_id: current_user.id, category_id: category.id) == nil

    CategoryUser.create(user_id: current_user.id, category_id: category.id)

    # html = erb :_category, layout: false, locals: {category_new: category}

    # {html: html}.to_json

    erb :_category, layout: false, local: {category_new: category}


  else

    status 400

  end

    

end










