class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

	def new
		if current_user
			@listing = Listing.new
		else
			redirect_to listings_path
		end
	end

	def create
		current_user.listings.create(listing_params)
		redirect_to listings_path
	end

	def show
		@listing = Listing.find(params[:id])
	end

	def destroy
		Listing.delete(params[:id])
		redirect_to listings_path
	end

	private
	def listing_params
    params.require(:listing).permit(:title, :description)
  end
end
