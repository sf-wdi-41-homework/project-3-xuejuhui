class RecipesController < ApplicationController
	def index
		@search_term = params[:looking_for] || 'chocolate'
  		@recipes = Recipe.for(@search_term)
  		@randomrecipes = @recipes.sample(3)	
	end 
	def create
		user = current_user
		@recipe = user.recipes.new(name: params[:name], date: DateTime.now)
		if @recipe.save
			flash[:success] = "You saved this recipe"
			redirect_to recipes_path
		else
			flash[:error] = @recipe.errors.full_messages.join(' ')
			redirect_to recipes_path
		end
	end 

	private
	def recipe_params
		params.require(:recipe).permit(:name, :ingredient)
	end 
end
