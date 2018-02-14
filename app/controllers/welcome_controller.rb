class WelcomeController < ApplicationController
	def index
	end

	def create
		Listings.create(params[:listing])
	end
end
