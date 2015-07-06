#all accepted
get "/friends" do
  @friends = current_user.accepted_friends
  erb :"friends/index"
end

#pending
get "/friends/pending" do
  @friends = current_user.pending_friends
  erb :"friends/pending"
end

#requests
get "/friends/requests" do
  @friends = current_user.friend_requests
  erb :"friends/requests"
end

# create/accept new friend
post "/friends/:friend_id/new" do
  @friend_rel = Friendship.where(user_id: params[:friend_id], friend_id: current_user.id).first || 
               Friendship.where(user_id: current_user.id, friend_id: params[:friend_id]).first
  @friend_rel[:accepted] = true
  if @friend_rel.save
    redirect "/friends/requests"
  else
    "I GOT AN ERROR D:"
  end
end

#create/invite new friend
post "/users/:user_id/friends" do
  Friendship.create(user_id: current_user.id, friend_id: params[:user_id])
  redirect "/profile"
end

# #destroy
delete  "/friends/:friend_id/delete" do
  @friend_rel = Friendship.where(user_id: params[:friend_id], friend_id: current_user.id).first || 
               Friendship.where(user_id: current_user.id, friend_id: params[:friend_id]).first
  @friend_rel.destroy
  redirect "/friends"
end

delete  "/friends/:friend_id" do
  @friend_rel = Friendship.where(user_id: params[:friend_id], friend_id: current_user.id).first || 
               Friendship.where(user_id: current_user.id, friend_id: params[:friend_id]).first
  @friend_rel.destroy
  redirect "/friends/requests"
end