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
		category: params[:category],
		link: params[:link],
		image: params[:image])
		if @restaurant.save
			ReminderMailer.reminder_email(user).deliver_later
			flash[:success] = "You saved this restaurant"
			redirect_to restaurants_path
		else
			flash[:error] = @recipe.errors.full_messages.join(' ')
			redirect_to restaurants_path
		end
	end 

end
