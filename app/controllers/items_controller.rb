
get '/categories/:category_id/items' do
  @category = Category.where(id: params[:category_id]).first
  @items = @category.items
  erb :items
end


post '/categories/:category_id/items' do
  @item = Item.create(name: params[:name], description: params[:description], price: params[:price], category_id: params[:category_id], user_id: session[:user_id])
  erb :_item, layout: false, locals: {item: @item}
end

get '/categories/:category_id/items/:item_id/edit' do
  @item = Item.find(params[:item_id])
  erb :update_item
end


put '/categories/:category_id/items/:item_id' do
  item = Item.find(params[:item_id])
  item.update_attributes(name: params[:name], description: params[:description], price: params[:price])
  redirect "/categories/#{params[:category_id]}/items"


end


delete '/categories/:category_id/items/:item_id' do
  item = Item.find(params[:post_id])
  item.destroy
  redirect to "/categories/#{params[:category_id]}/items"
end
