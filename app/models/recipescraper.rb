require "net/http"
require "uri"
require 'nokogiri'
require_relative 'HTMLWhitespaceCleaner'

module RecipeScraper


	def self.parse_url(url)
		# standard HTTP Request
		uri = URI.parse(url)
		# returns a NET object
		response = Net::HTTP.get_response(uri)
		html_body = response.body
		
		#cleans whitespace from HTML 
		clean_response = HTMLWhitespaceCleaner.clean(html_body)
		#turns HTML into Nokogiri object 
		nokogiri_object = Nokogiri.parse(clean_response)
		recipe_info = []
		title = nokogiri_object.css('title').text
		title = title.gsub(" - Allrecipes.com", "")
		recipe_info << title 

		ingredients = nokogiri_object.css('li.checkList__line').text
		ingredients = ingredients.gsub("ADVERTISEMENT", " +")
		ingredients = ingredients.gsub("Add all ingredients to list", "")
		ingredients = ingredients.split(" +")
		recipe_info << ingredients
		
		directions = nokogiri_object.css('div.directions--section__steps').text
		directions = directions.split(".")
		recipe_info << directions 

		recipe_info
	end

end 

