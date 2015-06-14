get '/login' do
  if session[:user_id]
  else
    erb :signup
  end
  erb :login
end

post '/login' do
  user = User.find_by(username: params[:username])

    if user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/categories'

  else
    erb :login
  end
end

get '/signup' do
  erb :signup
end

post '/signup' do

  @user = User.new(name: params[:name],
                   username: params[:username])

  @user.password = params[:password]

  if @user.save!
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :signup
  end


end

get '/profiles/:user_id' do
  p session[:user_id] = @user.id

  erb :profile
end


get '/logout' do
  session.delete(:user_id)

  redirect '/'
end


