
get '/login' do

  if current_user
    redirect '/'
  else
    erb :login
  end

end


post '/login' do

  if @user = User.authenticate(params[:username], params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = "Your login info was incorrect! Please try again!"
    erb :login
  end

end


get '/signup' do

  if current_user
    redirect '/'
  else
    erb :signup
  end

end


post '/signup' do

  if params[:password]
    user = User.new(name: params[:name], username: params[:username], password: params[:password])
    if user.save
      session[:user_id] = user.id
      redirect '/'
    end
  end
  @errors = "Sorry! Your username, or password, or BOTH are incorrect."
  erb :signup

end


get '/profiles/:user_id' do

  @user = User.find_by(id: params[:user_id])

  @friends = current_user.accepted_friends

  @pendingfriends = current_user.pending_friends

  if @user.id != current_user.id
    erb :userpage
  else
    erb :profile
  end

end

post '/profiles/:user_id/friends' do
  Friendship.create(user_id: current_user.id, friend_id: params[:user_id])
  redirect "/profiles/#{:user_id}"
end


get '/logout' do

  session.delete(:user_id)
  redirect '/'

end


