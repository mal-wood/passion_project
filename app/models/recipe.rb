class Recipe < ActiveRecord::Base
  belongs_to :user 
end



  # before_save :create_recipe_object

  # def create_recipe_object
  # 	self.scraped_save = RecipeScraper.parse_url(self.recipe_url)
  # end
