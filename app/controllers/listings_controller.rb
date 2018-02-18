
class ListingsController < ApplicationController
	def index
		# @listings = Listing.all
		if signed_in?
			@listings = Listing.order(created_at: :desc).page(params[:page])
		else
		end
	end

	def new
		if signed_in?
			if current_user.moderator?
				@listing = Listing.new
			else
				flash[:notice] = "You are not a moderator"
				redirect_to listings_path
			end
		else
			redirect_to sign_in_path
		end
	end

	def create
		if current_user.moderator?
			@listing = current_user.listings.new(listing_params)
			if @listing.save
				redirect_to @listing
			else
				redirect_to new_listing_path
			end
		else
			flash[:notice] = "You are not a moderator"
			redirect_to listings_path
		end
	end

	def edit
		@listing = Listing.find(params[:id])
	end

	def update
		@listing = Listing.find(params[:id])
		if @listing.update_attributes(listing_params)
			redirect_to @listing
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
