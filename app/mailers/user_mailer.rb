class UserMailer < ApplicationMailer
  default from: 'chengshair@gmail.com'


  def booking_email(customer, host, reservation_id)
    @customer = customer
    @host = host
    @reservation_id = reservation_id
    @reservation = Reservation.find(@reservation_id)
    @url = listing_reservation_url(@reservation.listing.id, @reservation.id)
    # "http://127.0.0.1:3000/listings/#{@reservation.listing_id}/reservations/#{@reservation_id}"

    mail(to: @customer.email, subject: 'Your have received a new booking')    

  end
  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')    

  end

end
