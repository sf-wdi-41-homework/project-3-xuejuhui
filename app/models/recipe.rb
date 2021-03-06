class Recipe < ApplicationRecord
  	belongs_to :user
	include HTTParty
	base_uri 'http://food2fork.com/api'
	default_params key: ENV["FOOD2FORK_KEY"]
 	format :json
 
 def self.for(term)
	get("/search", query: { q: term})["recipes"]
 end
 def self.ing(id)
 	get('/get', query: {rId: id})["recipe"]
 end

end
