class Restaurant < ApplicationRecord
  belongs_to :user
	API_HOST = "https://api.yelp.com"
	SEARCH_PATH = "/v3/businesses/search"
	BUSINESS_PATH = "/v3/businesses/"  # trailing / because we append the business id to the path
	TOKEN_PATH = "/oauth2/token"
	GRANT_TYPE = "client_credentials"

  def self.search(term, location)
  auth = "Bearer " + ENV['YELP_API']

  url = "#{API_HOST}#{SEARCH_PATH}"
  params = {
    term: term,
    location: location,
  }
  response = HTTP.auth(auth).get(url, params: params)
  response.parse
  end


end
