get '/recipes' do 
	@recipes = Recipe.all
	erb :'recipes/index'
end 

get '/recipes/new' do 
	@recipe_url = params[:recipe_url]
	@scraped_recipe = RecipeScraper.parse_url(@recipe_url)
	erb :'recipes/new'
end 

post '/recipes' do 
	p params[:scraped_recipe_title]
	p params[:scraped_recipe_ingredients]
	p params[:scraped_recipe_directions]
	redirect '/recipes'
end 