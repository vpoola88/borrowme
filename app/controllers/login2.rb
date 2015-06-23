
get '/sessions' do

  if current_user
    redirect '/'
  else
    erb :login
  end

end


post '/sessions' do

  if @user = User.authenticate(params[:username], params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = "Your login info was incorrect! Please try again!"
    erb :login
  end

end


get '/users/new' do

  if current_user
    redirect '/'
  else
    erb :signup
  end

end


post '/users' do

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


get '/users/:id' do

  @user = User.find_by(id: params[:user_id])
  erb :profile

end


delete '/sessions/:id' do

  session.delete(:user_id)
  redirect '/'

end


