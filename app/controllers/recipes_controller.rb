get '/recipes' do 
	@user = User.find(session[:id])
	@recipes = @user.recipes
	erb :'recipes/index'
end 

get '/recipes/new' do 
	@recipe_url = params[:recipe_url]
	@scraped_recipe = RecipeScraper.parse_url(@recipe_url)
	@recipe = Recipe.create(title: @scraped_recipe[0], ingredients: @scraped_recipe[1], directions: @scraped_recipe[2], user_id: session[:id])
	erb :'recipes/new'
end 

post '/recipes' do 
	redirect '/recipes'
end 

get '/recipes/:id' do
	@recipe = Recipe.find(params[:id]) 
	erb :'recipes/show'
end 