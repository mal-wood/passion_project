require_relative '../models/recipescraper'

get '/users/new' do 
	erb :'users/new', layout: false
end

post '/users' do 
	@user = User.new(params[:user])
	if @user.save 
		session[:id] = @user.id
		redirect "/users/#{@user.id}"
	else 
		erb :'users/new', layout: false
	end
end 

get '/users/testing' do 
	erb :'users/testing'
end

get '/users/:id' do  
	@user = User.find(params[:id])
	erb :'users/show'
end




