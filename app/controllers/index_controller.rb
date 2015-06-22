# CREATE
get '/categories/:category_id/items' do

  @category = Category.where(id: params[:category_id])
  @items = Item.where(category_id: params[:category_id])

  erb :items
end

post '/categories/:category_id/items' do
  p params

  @item = Item.create(name: params[:name], description: params[:description], price: params[:price], category_id: params[:category_id], user_id: session[:user_id])

  # redirect "/categories/#{params[:category_id]}/items"

  erb :_test, layout: false, locals: {item: @item}

end

get '/' do
  if current_user
    @all_users = User.where.not(id: session[:user_id])
    @user = User.find(session[:user_id])
    @items = @user.items
    erb :index
  else
    erb :index
  end

end


get '/categories' do

  redirect '/login' unless session[:user_id]

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



# UPDATE

get '/categories/:category_id/items/:item_id' do

  @item = Item.find_by(id: params[:item_id])

  erb :update_item

end

put '/categories/:category_id/items/:item_id' do
  item = Item.find_by(id: params[:item_id])
  item.update_attributes(name: params[:name], description: params[:description], price: params[:price])

  redirect "/categories/#{params[:category_id]}/items"
end


# DELETE
delete '/categories/:category_id/items/:item_id' do
  item = Item.find(params[:post_id])
  item.destroy

  redirect to "/categories/#{params[:category_id]}/items"
end


post '/search' do
  p params.inspect
  @search = Item.where(name: params[:search])

  # erb :search

  erb :search, locals: {search: @search}, layout: false

end







