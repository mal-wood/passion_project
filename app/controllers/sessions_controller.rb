get '/inspector' do
  session.inspect
end

get '/sessions/new' do 
	erb :'sessions/new'
end

post '/sessions' do 
	email = params[:user][:email]
	password = params[:user][:password]
	@user = User.find_by(email: params[:user][:email])
	if @user && User.authenticate(email, password)
			# session[:user_id] = @user.id
			# redirect "/users/#{@user.id}"
			redirect "/"
		end
end
