
class ListingsController < ApplicationController

	def index
		if signed_in?
			@listing = Listing.new
			@listings = Listing.all
			@listings = @listings.page(params[:page])
		else
			redirect_to sign_in_path
		end
	end
	def new
		if signed_in?
			if current_user.host? || current_user.admin?
				@listing = Listing.new
			else
				flash[:notice] = "You are not a host"
				redirect_to listings_path
			end
		else
			redirect_to sign_in_path
		end
	end
	def create	
		if current_user.host? || current_user.admin?
			@listing = current_user.listings.new(listing_params)
			if @listing.save
				redirect_to @listing
			else
				redirect_to new_listing_path
			end
		else
			flash[:notice] = "You are not a host"
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

	def search

		if signed_in?
			@listings = Listing.order(:city)
			if params[:city_search].present?
				@listings = Listing.search_by_title(params[:city_search])
			end
			if params[:date].present?
				(start_date, end_date) = params[:date].split(" to ")
				date_span = (start_date.to_date..end_date.to_date).to_a
				date_span.map!{|date| date.to_s}
				@listings = Listing.date(date_span, @listings)
			end
			if params[:amenities].present?

				@listings = Listing.amenities(params[:amenities], @listings)
			end		
			@listings = @listings.page(params[:page])
			respond_to do |format|
			  format.js
			end
		else
			redirect_to sign_in_path
		end
	end

	def autocomplete
		cities = Listing.search_city(params["query"])
		# respond_to do |format|
		# 	format.html
		# 	format.json { render json: cities }
		# end
    render json: cities
	end

	def uploadimage
		@listing = Listing.find(params[:listing_id])

		images = @listing.image

		images += params[:images]
		@listing.image = images
		@listing.save
		
		respond_to do |format|
		  format.json { render json: @listing}
		end
	end



	private
	def listing_params
  	  params.require(:listing).permit(:title, :city, :description, :price, {image: [], amenities: []})
  end
  def slice_listing_params
  	params.slice(:city_search, :date, :amenities)
  end


end
