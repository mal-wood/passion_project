get '/sessions/login' do 
	erb :'sessions/login'
end

post '/sessions/login' do 
	p params
	# User.authenticate(params[:email], params[:password])
	# redirect 'users/#{user.id}/'
end
