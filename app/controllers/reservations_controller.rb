class ReservationsController < ApplicationController


	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
	end
  def create
    listing = Listing.find(params[:listing_id])
    (start_date, end_date) = params[:reservation]["start_date"].split(" to ")
    @reservation = current_user.reservations.new(
      start_date: start_date.to_date,
      end_date: end_date.to_date,
      listing_id: listing.id
      )
    @reservation.save
    redirect_to new_payment_path(@reservation)
  end

  def itinerary
    @reservations = current_user.reservations.order(created_at: :desc)

  end

  def show 
    @reservation = Reservation.find(params[:id])
  end
  private


  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end



