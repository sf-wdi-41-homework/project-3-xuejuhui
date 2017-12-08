class RestaurantsController < ApplicationController
	def index
		term = params[:term]
		location = params[:location] || "SF"
		@restaurant = Restaurant.search(term, location)
		@restaurant = @restaurant["businesses"].sample(3)
		
	end 
	def create
		user = current_user
		@restaurant = user.restaurants.new(name: params[:name], 
		address: params[:address], 
		price: params[:price],
		category: params[:category])
		if @restaurant.save
			flash[:success] = "You saved this restaurant"
			redirect_to restaurants_path
		else
			flash[:error] = @recipe.errors.full_messages.join(' ')
			redirect_to restaurants_path
		end
	end 

end
