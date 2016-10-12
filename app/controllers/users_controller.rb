require_relative '../models/recipescraper'

get '/users/new' do 
	erb :'users/new'
end

post '/users' do 
	@user = User.new(params[:user])
	if @user.save 
		redirect "/users/#{@user.id}"
	else 
		erb :'users/new'
	end
end 

get '/users/testing' do 
	erb :'users/testing'
end

get '/users/:id' do  
	@user = User.find(params[:id])
	erb :'users/show'
end

post '/testing' do 
	@recipe_url = params[:recipe_url]
	@scraped_recipe = RecipeScraper.parse_url(@recipe_url)
	p @scraped_recipe
	erb :'users/testing'
end 




