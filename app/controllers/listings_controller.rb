
class ListingsController < ApplicationController
	def index
		# @listings = Listing.all
		if current_user
			@listings = Listing.all.page(params[:page])
		else
			redirect_to sign_in_path
		end
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
	def update
		@listing = Listing.find(params[:id])
		if @listing.update_attributes(listing_params)
			redirect_to listings_path
		else
			redirect_to edit_listing_path(@listing)
		end
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
