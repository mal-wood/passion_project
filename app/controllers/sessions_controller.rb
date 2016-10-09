get '/inspector' do
  session.inspect
end

get '/sessions/new' do 
	erb :'sessions/new'
end

post '/sessions' do 
	@user = User.authenticate(params[:email], params[:password])
		if @user
				redirect "/users/#{user.id}"
				session[:user_id] = @user.id
			else
			redirect "/" 
		end
end
