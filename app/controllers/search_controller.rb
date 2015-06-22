post '/search' do

  @search = Item.where(name: params[:search])

  erb :search, locals: {search: @search}, layout: false

end
