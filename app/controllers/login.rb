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


get '/logout' do
  session.delete(:user_id)

  redirect '/'
end


