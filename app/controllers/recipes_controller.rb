class RecipesController < ApplicationController
	
	def index
		@search_term = params[:looking_for] || "chicken"
  		@recipes = Recipe.for(@search_term)
  		@randomrecipes = @recipes.sample(3)
  		@randomrecipes.each do |course|
	  		search_ing = course["recipe_id"]
  			@ingredients = Recipe.ing(search_ing)
  		end 
	end 
	def create
		user = current_user
		@recipe = user.recipes.new(name: params[:name], 
			date: DateTime.now, 
			ingredient: params[:ingredient], 
			image: params[:image])
		if @recipe.save
			flash[:success] = "You saved this recipe"
			redirect_to recipes_path
		else
			flash[:error] = @recipe.errors.full_messages.join(' ')
			redirect_to recipes_path
		end
	end 
end
