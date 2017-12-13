class User < ApplicationRecord
	validates :password, presence: true, length: {minimum: 6}
	validates :username, presence: true, uniqueness: true
	has_many :recipes, dependent: :destroy
	has_many :restaurants, dependent: :destroy
	has_secure_password
	def self.confirm(params)
  	@user = User.find_by({username: params[:username]})
  	@user ? @user.authenticate(params[:password]) : false
	end
end
