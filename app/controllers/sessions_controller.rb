get '/inspector' do
  session.inspect
end

get '/sessions/new' do 
	erb :'sessions/new'
end

# post '/sessions' do 
# 	@user = User.find_by(email: params[:email])
# 	if User.authenticate(params[:email], params[:password])
# 				session[:id] = @user.id
# 				redirect "/"
# 				# redirect "/users/#{@user.id}"
# 			else
# 			erb :'users/new'
# 		end
# end

post '/sessions' do
  user = User.authenticate(params[:email], params[:password])
  redirect '/' unless user
  session[:user_id] = user.id
  redirect "/users/#{user.id}"
end