class PaymentsController < ApplicationController
  def new
    @client_token = Braintree::ClientToken.generate
  end

  def checkout
    reservation = Reservation.find(params[:reservation_id])
    @reservation = reservation
    @host = @reservation.listing.user
    @costumer = @reservation.user

    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    result = Braintree::Transaction.sale(
     :amount => reservation.price, #this is currently hardcoded
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )

    if result.success?
      reservation.update_used_date
      reservation.update_attribute(:payment_status, true)
      UserMailer.booking_email(@costumer, @host, @reservation.id).deliver_later
      
      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else
      redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
    end   
  end
end
