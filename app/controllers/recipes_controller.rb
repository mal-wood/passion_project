get '/user/:id/recipes' do 
	@user = User.find(session[:id])
	@recipes = @user.recipes
	erb :'recipes/index'
end 

get '/user/:id/recipes/new' do 
	@user = User.find(params[:id])
	@recipe_url = params[:recipe_url]
	@scraped_recipe = RecipeScraper.parse_url(@recipe_url)
	@recipe = Recipe.create(title: @scraped_recipe[0], ingredients: @scraped_recipe[1], directions: @scraped_recipe[2], user_id: session[:id])
	erb :'recipes/show'
end 

post '/recipes' do 
	redirect '/recipes'
end 

get '/user/:user_id/recipes/:id/edit' do 
	@user = User.find(params[:user_id])
	@recipe = Recipe.find(params[:id])
	erb :'recipes/edit'
end 

get '/user/:user_id/recipes/:id' do 
	@user = User.find(params[:user_id])
	@recipe
	p "88888"
	@recipe = Recipe.find(params[:id])
	erb :'recipes/show'
end

put '/user/:user_id/recipes/:id' do
	@recipe = Recipe.find(params[:id])
	p params[:recipe]
	p "88888"
	@recipe.update_attributes(params[:recipe])
	@user = User.find(params[:user_id])
	if @recipe.save
		redirect "/user/#{@user.id}/recipes/#{@recipe.id}"
	else
		erb :'recipes/edit'
	end
end

delete '/user/:user_id/recipes/:id' do 
	@user = User.find(params[:user_id])
	@recipe = Recipe.find(params[:id])
	@recipe.destroy
	redirect "/user/#{@user.id}/recipes"
end