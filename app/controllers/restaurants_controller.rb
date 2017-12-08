class RestaurantsController < ApplicationController
	def index
		term = params[:term]
		location = params[:location] || "SF"
		@restaurant = Restaurant.search(term, location)
		p @restaurant
	end 

end
