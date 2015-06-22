
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
