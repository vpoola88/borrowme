get '/' do
  if session[:user_id]
    @all_users = User.where.not(id: session[:user_id])
    @user = User.find(session[:user_id])
    @items = @user.items
    erb :index
  else
    erb :index
  end

end


post '/search' do

  @search = Item.where(name: params[:search])

  erb :search

end







