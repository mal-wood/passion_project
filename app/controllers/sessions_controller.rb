get '/inspector' do
  session.inspect
end

get '/sessions/new' do 
	erb :'sessions/new'
end

post '/sessions' do 
 	@user = User.authenticate(params[:email], params[:password])
 			if @user 
 				session[:id] = @user.id
 				redirect "/users/#{@user.id}"
 			else
 			erb :'users/new'
 		end
 end
