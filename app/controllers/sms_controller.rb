post '/sms/:recipe_id' do 
	@recipe = Recipe.find(params[:recipe_id])
	@recipe_string = @recipe.ingredients.map(&:inspect).join(', ')
	Notifier::send_sms_notification("+17248126820", @recipe_string)
	p @recipe.ingredients
	redirect "/user/#{session[:id]}/recipes"
end
