get '/' do

  erb :index

end


get '/categories' do

  @categories = Category.all
  erb :categories
  
end

get '/categories/:id/posts' do
  
  @posts = Post.where(id: params[:category_id])

  erb :post

end