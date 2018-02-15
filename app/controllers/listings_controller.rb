
class ListingsController < ApplicationController
	def index
		# @listings = Listing.all
		@listings = Listing.order(created_at: :asc).page(params[:page])
	end

	def new
		if current_user
			@listing = Listing.new
		else
			redirect_to listings_path
		end
	end

	def create
		@listing = current_user.listings.new(listing_params)
		if @listing.save
			redirect_to @listing
		else
			redirect_to new_listing_path
		end
	end

	def edit
		@listing = Listing.find(params[:id])
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
