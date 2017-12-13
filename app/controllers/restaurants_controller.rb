class RestaurantsController < ApplicationController
	def index
		@term = params[:term]
		@location = params[:location]
		@restaurant = Restaurant.search(@term, @location)
		if @restaurant["businesses"] == nil
			@location = "SF"
			@restaurant = Restaurant.search(@term, @location)
			@restaurant = @restaurant["businesses"].sample(3)

		else
			@restaurant = @restaurant["businesses"].sample(3)
		end 
		
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
			flash[:error] = @restaurant.errors.full_messages.join(' ')
			redirect_to restaurants_path
		end
	end 
	def destroy
		user = current_user
		restaurants = user.restaurants
		restaurant = restaurants.find(params[:id])
		restaurant.destroy
		redirect_to user_path(user) 
	end

end
