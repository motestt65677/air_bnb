
class ListingsController < ApplicationController
	def index
		# @listings = Listing.all




		@listing = Listing.new


		if signed_in?
			@listings = Listing.all

			if params[:city_search].present?
				@listings = Listing.search_by_title(params[:city_search])
			end

			if params[:city].present?
				@listings = @listings.city(params[:city])
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
		else
			redirect_to sign_in_path
		end
	end

	def search
		cities = Listing.search_city(params["query"])
		# respond_to do |format|
		# 	format.html
		# 	format.json { render json: cities }
		# end
    render json: cities
	end

	def new
		if signed_in?
			if current_user.host?
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
		
		if current_user.host?

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

	private
	def listing_params


  	  params.require(:listing).permit(:title, :description, :price, {image: [], amenities: []})

  end
end
