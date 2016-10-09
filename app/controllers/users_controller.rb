get '/users/new' do 
	erb :'users/new'
end

post '/users' do 
	@user = User.new(params[:user])
	if @user.save 
		redirect '/users/#{@user.id}'
	else 
		erb :index
	end
end 

get '/users/:id' do  
	# @user = User.find(params[:id])
	erb :'users/show'
end


